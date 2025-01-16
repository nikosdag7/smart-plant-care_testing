from flask import render_template, flash, redirect, url_for, request, session, abort, jsonify
from flask_login import login_user, logout_user, login_required, \
    current_user
from flask_babel import _
from . import crop
#from .forms import RegistrationForm, LoginForm
#from SmartPlantCare.forms import NewCropForm
from .forms.newCropForm import newCropForm
from .models import Prefecture,PrefectureName,Area,AreaName,CropType,CropTypeName,SoilType,SoilTypeName,Crop,CropCoordinates
from ..user.models import User
from .. import db
#from werkzeug.urls import url_parse

from SmartPlantCare import app

import secrets
from PIL import Image
import os

from datetime import datetime as dt

import folium
import json
#import jsonify
from scipy.spatial import ConvexHull

current_year = dt.now().year

###############################################################################
# Function that takes a map and a list of points (LON,LAT tuples) and
# returns a map with the convex hull polygon from the points as a new layer
###############################################################################
def create_convexhull_polygon(
    map_object, list_of_points, layer_name, line_color, fill_color, weight, text
):

    # Since it is pointless to draw a convex hull polygon around less than 3 points check len of input
    if len(list_of_points) < 3:
        return

    # Create the convex hull using scipy.spatial
    form = [list_of_points[i] for i in ConvexHull(list_of_points).vertices]

    # Create feature group, add the polygon and add the feature group to the map
    fg = folium.FeatureGroup(name=layer_name)
    fg.add_child(
        folium.vector_layers.Polygon(
            locations=form,
            color=line_color,
            fill_color=fill_color,
            weight=weight,
            popup=(folium.Popup(text)),
        )
    )
    map_object.add_child(fg)

    return map_object


###############################################################################
# Function to draw points in the map
###############################################################################
def draw_points(map_object, list_of_points, layer_name, line_color, fill_color, text):

    fg = folium.FeatureGroup(name=layer_name)

    for point in list_of_points:
        fg.add_child(
            folium.CircleMarker(
                point,
                radius=1,
                color=line_color,
                fill_color=fill_color,
                popup=(folium.Popup(text)),
            )
        )

    map_object.add_child(fg)


###############################################################################
# Function to save crop image file 
###############################################################################
def image_save(image, where, size):
    random_filename = secrets.token_hex(8)
    file_name, file_extension = os.path.splitext(image.filename)
    image_filename = random_filename + file_extension
    image_path = os.path.join(app.root_path, 'static/images/'+ where, image_filename)

    image_size = size # this must be a tupe in the form of: (150, 150)
    img = Image.open(image)
    img.thumbnail(image_size)

    img.save(image_path)

    return image_filename


@crop.route('/get_prefectures')
@login_required
def get_prefectures():
    lang_id = session.get('lang_id')
    prefectures = PrefectureName.query.filter_by(language_id=lang_id).order_by(PrefectureName.id.asc()).all()
    #print(prefectures)
    #return render_template("index.html", prefectures=prefectures)
    return jsonify({"prefectures": [{"id": p.prefecture_id, "name": p.name} for p in prefectures]})

@crop.route('/get_areas/<int:prefecture_id>', methods=['GET'])
@login_required
def get_areas(prefecture_id):
    lang_id = session.get('lang_id')
    areas = AreaName.query.filter_by(prefecture_id=prefecture_id,language_id=lang_id).order_by(AreaName.id.asc()).all()
    #print(areas)
    #return render_template("index.html", areas=areas)
    return jsonify({"areas": [{"id": a.area_id, "name": a.name} for a in areas]})


@crop.route("/crops/")
@login_required
def crops():

    ordering_by = request.args.get('ordering_by')

    ## Pagination: page value from 'page' parameter from url
    page = request.args.get('page', 1, type=int)

    if ordering_by==None:
        crops = Crop.query.order_by(Crop.id.asc()).paginate(per_page=5, page=page)
    elif ordering_by=='name':
        crops = Crop.query.order_by(Crop.name.asc()).paginate(per_page=5, page=page)
    elif ordering_by=='crop_size':
        crops = Crop.query.order_by(Crop.crop_size.desc()).paginate(per_page=5, page=page)
    else:
        return render_template('404.html'), 404
    
    return render_template("crops.html", crops=crops, ordering_by=ordering_by)


@crop.route("/new_crop/", methods=["GET", "POST"])
@login_required
def new_crop():
    
    form = newCropForm()
    lang_id = session.get('lang_id')
    #prefectures = PrefectureName.query.filter_by(language_id=lang_id).order_by(PrefectureName.id.asc())
    #areas = AreaName.query.filter_by(language_id=lang_id).order_by(AreaName.id.asc())
    crop_types = CropTypeName.query.filter_by(language_id=lang_id).order_by(CropTypeName.id.asc())
    soil_types = SoilTypeName.query.filter_by(language_id=lang_id).order_by(SoilTypeName.id.asc())

    #for soil_type in soil_types:
    #    print(soil_type.name)

    if request.method == 'POST' and form.validate_on_submit():
        name = form.name.data
        location = form.location.data
        prefecture = form.prefecture.data
        area = form.area.data
        crop_size = form.crop_size.data
        crop_type = form.crop_type.data
        soil_type = form.soil_type.data
        
        if form.image.data:
            try:
                image_file = image_save(form.image.data, 'crops_images', (640, 640))
            except:
                abort(415)
        
            crop = Crop(owner=current_user,
                        name=name,
                        location=location,
                        prefecture=prefecture,
                        area=area,
                        crop_size=crop_size,
                        crop_type=crop_type,
                        soil_type=soil_type)
        else:
            crop = Crop(owner=current_user,
                        name=name,
                        location=location,
                        prefecture=prefecture,
                        area=area,
                        crop_size=crop_size,
                        crop_type=crop_type,
                        soil_type=soil_type
                        )

        db.session.add(crop)
        db.session.commit()
        
        #flash(_('The crop <b>{name}</b> was successfully created').format(name=name), 'success')

        # Crate map with folium
        #m = folium.Map(location=[35.27725435001448, 25.16170491073076], zoom_start=13)

        ### Receive a list of coordinates and display them on a map. ###
        try:
            # Get the list of coordinates from the POST request
            #coordinates = request.json.get('coordinates', [])
            coordinates = json.loads(form.crop_map.data)
            # Validate coordinates
            if not coordinates or not all(isinstance(coord, list) and len(coord) == 2 for coord in coordinates):
                #return jsonify({'error': 'Invalid coordinates format. Expecting a list of [latitude, longitude] pairs.'}), 400
                print('error: Invalid coordinates format. Expecting a list of [latitude, longitude] pairs.')
                print(str(e))
                flash(_('Error handling Crop Coordinates Data'), 'error')

            map_center = coordinates[0] # First point
            crop_map = folium.Map(location=map_center,
                zoom_start=20,
                tiles="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
                attr = 'Esri',
                name = 'Esri Satellite',
                overlay = False,
                control = True
                )

            # Draw Crop
            create_convexhull_polygon(
                crop_map,
                coordinates,
                layer_name=name,
                line_color="Red",
                fill_color="Pink",
                weight=5,
                text=name,
            )

            # Add point with Crop name
            folium.Marker(
                coordinates[0], # First point
                popup=name, # Crop name
                tooltip=_('Click from more information'),
                icon=folium.Icon(color="blue", icon="info-sign"),
            ).add_to(crop_map)

            # Convert map to HTML string
            crop_map_html = crop_map._repr_html_()

        except Exception as e:
            #return jsonify({"error": str(e)}), 500  
            print(str(e))
            flash(_('Error handling Crop Coordinates Data'), 'error')

        # Save coordinates (Map Data) in database
        try:
            for crop_coords in coordinates:
                #print('#%#')
                #print(crop_coords)
                lon, lat = crop_coords
                new_coord = CropCoordinates(crop_id=crop.id, longtitute=lon, latitude=lat)
                db.session.add(new_coord)
            db.session.commit()

        except Exception as e:
            #return jsonify({"error": str(e)}), 500  
            print(str(e))
            flash(_('Error handling Crop Coordinates Data'), 'error')
            db.session.rollback()

        flash(_('The crop <b>{name}</b> was successfully created').format(name=name), 'success')
        
        #return render_template("crop.html", form=form, crop=crop, page_title=_('Αdd new Crop'), map_html=crop_map_html, prefectures=prefectures, areas=areas, crop_types=crop_types, soil_types=soil_types)
        return redirect(url_for('crop.showCrop', crop_id=crop.id))
    #return redirect(url_for('crop.crops'))
    return render_template("new_crop.html", form=form, page_title=_('Αdd new Crop'), crop_types=crop_types, soil_types=soil_types)


### User crops list ###

@crop.route("/my_crops", methods=["GET"])
@login_required
def my_crops():

    ordering_by = request.args.get('ordering_by')
    page=1
    
    user = User.query.get_or_404(1)

    if ordering_by==None:
        crops = Crop.query.filter_by(owner=current_user).order_by(Crop.id.asc()).paginate(per_page=3, page=page)
    elif ordering_by=='name':
        crops = Crop.query.filter_by(owner=current_user).order_by(Crop.name.asc()).paginate(per_page=3, page=page)
    elif ordering_by=='crop_size':
        crops = Crop.query.filter_by(owner=current_user).order_by(Crop.crop_size.desc()).paginate(per_page=3, page=page)
    else:
        return render_template('404.html'), 404

    return render_template("my_crops.html", crops=crops, owner=current_user, ordering_by=ordering_by)


@crop.route("/crop/<int:crop_id>", methods=["GET"])
def showCrop(crop_id):

    crop = Crop.query.get_or_404(crop_id)
    name = crop.name
    lang_id = session.get('lang_id')
    prefecture = PrefectureName.query.filter_by(prefecture_id=crop.prefecture, language_id=lang_id).one_or_404()
    area = AreaName.query.filter_by(area_id=crop.area, language_id=lang_id).one_or_404()
    crop_type = CropTypeName.query.filter_by(crop_type_id=crop.crop_type, language_id=lang_id).one_or_404()
    soil_type = SoilTypeName.query.filter_by(soil_type_id=crop.soil_type, language_id=lang_id).one_or_404()
    crop_coords = CropCoordinates.query.filter(CropCoordinates.crop_id == crop_id).all()
    form = newCropForm()
    #print('# 1 #')
    #print(crop.name)
    #print(prefecture.name)
    #print(prefecture.name)
    #print(prefecture.name)
    #crop = Crop.query.filter_by(owner=current_user).order_by(Crop.id.asc()).paginate(per_page=3, page=page)
    #coordinates = CropCoordinates.query.filter_by(crop_id=crop.id).order_by(CropCoordinates.id.asc()).get
    #query = db.session.query(Area).join(Prefecture, Prefecture.id == Area.id).filter_by()
    #print(query)
    # Εκτέλεση του query
    #results = query.all()
    #print(results)
    # Εκτύπωση των αποτελεσμάτων
    #for area, prefecture in results:
    #    print(f"Area: {area.name}, Prefecture: {prefecture.name}")

    crop_map_html = False
    if crop_coords:
        #print('# 1 #')
        #print(crop_coords)
        
        try:
            # Convert in tuple list (longitude, latitude)
            coords_list = [(coord.longtitute, coord.latitude) for coord in crop_coords]
            #print('# 2 #')
            #print(coords_list)
            # Convert List to JSON
            coordinates_list = json.dumps(coords_list)
            coordinates = json.loads(coordinates_list)
            #print('# 3 #')
            #print(coordinates)

            # Validate coordinates
            if not coordinates or not all(isinstance(coord, list) and len(coord) == 2 for coord in coordinates):
                #return jsonify({'error': 'Invalid coordinates format. Expecting a list of [latitude, longitude] pairs.'}), 400
                print('error: Invalid coordinates format. Expecting a list of [latitude, longitude] pairs.')
                print(str(e))
                flash(_('Error handling Crop Coordinates Data'), 'error')

            map_center = coordinates[0] # First point
            crop_map = folium.Map(location=map_center,
                zoom_start=20,
                tiles="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
                attr = 'Esri',
                name = 'Esri Satellite',
                overlay = False,
                control = True
                )

            # Draw Crop
            create_convexhull_polygon(
                crop_map,
                coordinates,
                layer_name=name,
                line_color="Red",
                fill_color="Pink",
                weight=5,
                text=name,
            )

            # Add point with Crop name
            folium.Marker(
                coordinates[0], # First point
                popup=name, # Crop name
                tooltip=_('Click from more information'),
                icon=folium.Icon(color="blue", icon="info-sign"),
            ).add_to(crop_map)

            # Convert map to HTML string
            crop_map_html = crop_map._repr_html_()

        except Exception as e:
            #return jsonify({"error": str(e)}), 500  
            print(str(e))
            flash(_('Error handling Crop Coordinates Data'), 'error')

    return render_template("crop.html", form=form, crop=crop, map_html=crop_map_html, prefecture=prefecture, area=area, crop_type=crop_type, soil_type=soil_type)


@crop.route("/crops_by_owner/<int:owner_id>")
def crops_by_owner(owner_id):
    

    ordering_by = request.args.get('ordering_by')

    ## Pagination: page value from 'page' parameter from url
    page = request.args.get('page', 1, type=int)
    
    user = User.query.get_or_404(owner_id)

    if ordering_by==None:
        crops = Crop.query.filter_by(owner=user).order_by(Crop.id.asc()).paginate(per_page=3, page=page)
    elif ordering_by=='name':
        crops = Crop.query.filter_by(owner=user).order_by(Crop.name.asc()).paginate(per_page=3, page=page)
    elif ordering_by=='crop_size':
        crops = Crop.query.filter_by(owner=user).order_by(Crop.crop_size.desc()).paginate(per_page=3, page=page)
    else:
        return render_template('404.html'), 404

    return render_template("crops_by_owner.html", crops=crops, owner=user, ordering_by=ordering_by)


@crop.route("/edit_crop/<int:crop_id>", methods=['GET', 'POST'])
@login_required
def edit_crop(crop_id):

    crop = Crop.query.filter_by(id=crop_id, owner=current_user).first_or_404()
    lang_id = session.get('lang_id')
    #prefectures = PrefectureName.query.filter_by(language_id=lang_id).order_by(PrefectureName.id.asc())
    #areas = AreaName.query.filter_by(language_id=lang_id).order_by(AreaName.id.asc())
    crop_types = CropTypeName.query.filter_by(language_id=lang_id).order_by(CropTypeName.id.asc())
    soil_types = SoilTypeName.query.filter_by(language_id=lang_id).order_by(SoilTypeName.id.asc())

    form = newCropForm(
        name = crop.name,
        location = crop.location,
        prefecture = crop.prefecture,
        area = crop.area,
        crop_size = crop.crop_size,
        crop_type = crop.crop_type,
        soil_type = crop.soil_type
        )

    if request.method == 'POST' and form.validate_on_submit():
        crop.name = form.name.data
        crop.location = form.location.data
        crop.prefecture = form.prefecture.data
        crop.area = form.area.data
        crop.crop_size = form.crop_size.data
        crop.crop_type = form.crop_type.data
        crop.soil_type = form.soil_type.data

        # Map Data exists
        if form.crop_map.data:
            #print(form.crop_map.data)

            # Convert String to JSON            
            try:
                coordinates = json.loads(form.crop_map.data)
            except Exception as e:
                print(form.crop_map.data)
                print(str(e))
                flash(_('Error handling Crop Coordinates Data'), 'error')
            try:
                # Delete previous Map Data
                CropCoordinates.query.filter(CropCoordinates.crop_id == crop.id).delete()
                #Add new Map Data
                for crop_coords in coordinates:
                    lon, lat = crop_coords
                    new_coord = CropCoordinates(crop_id=crop.id, longtitute=lon, latitude=lat)
                    db.session.add(new_coord)
                #db.session.commit()
            except Exception as e:
                print(form.crop_map.data)
                print(str(e))
                flash(_('Error handling Crop Coordinates Data'), 'error')
                db.session.rollback()
        else:
            print("no map data")
            try:
                # Delete previous Map Data
                CropCoordinates.query.filter(CropCoordinates.crop_id == crop.id).delete()
                #db.session.commit()
            except Exception as e:
                db.session.rollback()
                print(str(e))
                flash(_('Error handling Crop Coordinates Data'), 'error')

        if form.image.data:
            try:
                image_file = image_save(form.image.data, 'crops_images', (640, 640))
            except:
                abort(415)

            crop.image = image_file

        db.session.commit()
    
        flash(_('The crop was successfully edited'), 'success')

        return redirect(url_for('crop.showCrop', crop_id=crop.id))

    return render_template("new_crop.html", form=form, crop=crop, page_title=_('Edit Crop'),
                           crop_types=crop_types,soil_types=soil_types,
                           selected_prefecture=crop.prefecture, selected_area=crop.area)


@crop.route("/delete_crop/<int:crop_id>", methods=["GET", "POST"])
@login_required
def delete_crop(crop_id):

    crop = Crop.query.filter_by(id=crop_id, owner=current_user).first_or_404()

    if crop:

        db.session.delete(crop)
        db.session.commit()

        flash(_('The crop was successfully deleted.'), 'success')

        return redirect(url_for("crop.crops"))

    flash(_('The crop was not found.'), 'warning')

    return redirect(url_for('crop.crops'), form=form)
