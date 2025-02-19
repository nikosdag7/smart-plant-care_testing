from flask import render_template, flash, redirect, url_for, request, session, abort, jsonify
from flask_login import login_required, current_user
#from flask_login import login_user, logout_user
from flask_babel import _
import json
from pyproj import Transformer
from . import crop
from .forms.newCropForm import newCropForm
from .models import PrefectureName, AreaName, CropTypeName, SoilTypeName, Crop, CropCoordinates
#from .models import Prefecture,Area,CropType,SoilType
from ..user.models import User
from ..sensor.models import Sensor
from .. import db

import subprocess
import os

#from SmartPlantCare.crop.add_points import add_points
from .create_map import create_map
from .save_image import save_image


#from werkzeug.urls import url_parse

from SmartPlantCare import app



import secrets
from PIL import Image
import os


from datetime import datetime as dt

import folium
import json
from pyproj import Transformer
#import jsonify
from scipy.spatial import ConvexHull

#current_year = dt.now().year

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
    image_path = os.path.join(app.root_path, 'static/images/', image_filename)

    image_size = size # this must be a tupe in the form of: (150, 150)
    img = Image.open(image)
    img.thumbnail(image_size)

    img.save(image_path)

    return image_filename

from .create_map import create_map
from .save_image import save_image
from SmartPlantCare import app

@crop.route('/get_prefectures')
@login_required
def get_prefectures():
    lang_id = session.get('lang_id')
    prefectures = PrefectureName.query.filter_by(language_id=lang_id).order_by(PrefectureName.id.asc()).all()
    return jsonify({"prefectures": [{"id": p.prefecture_id, "name": p.name} for p in prefectures]})


@crop.route('/get_areas/<int:prefecture_id>', methods=['GET'])
@login_required
def get_areas(prefecture_id):
    lang_id = session.get('lang_id')
    areas = AreaName.query.filter_by(prefecture_id=prefecture_id,language_id=lang_id).order_by(AreaName.id.asc()).all()
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
    crop_types = CropTypeName.query.filter_by(language_id=lang_id).order_by(CropTypeName.id.asc())
    soil_types = SoilTypeName.query.filter_by(language_id=lang_id).order_by(SoilTypeName.id.asc())

    if request.method == 'POST' and form.validate_on_submit():
        name = form.name.data
        location = form.location.data
        prefecture = form.prefecture.data
        area = form.area.data
        crop_size = form.crop_size.data
        crop_type = form.crop_type.data
        soil_type = form.soil_type.data
        coordinates_type = form.coordinates_type.data

        if form.image.data:
            try:
                image_file = save_image(app, form.image.data, 'crops_images', (640, 640))
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

        if len(form.crop_map.data) > 0:
            try:

                coordinates = json.loads(form.crop_map.data)

                if not coordinates:
                    flash(_('ERROR: Invalid coordinates format. Expecting a list of [latitude, longitude] pairs.'), 'warning')
                else:
                    # Save coordinates (Map Data) in database
                    try:
                        
                        # Settting for tranformation from EGSA87 (EPSG:2100) to WGS84 (EPSG:4326)
                        transformer = Transformer.from_crs("epsg:2100", "epsg:4326", always_xy=False)
                            
                        for crop_coords in coordinates:
                            lon, lat = crop_coords
                            if coordinates_type == "2100":
                                lon, lat = transformer.transform(lon, lat)
                            new_coord = CropCoordinates(crop_id=crop.id, longtitute=lon, latitude=lat)
                            db.session.add(new_coord)
                        db.session.commit()
                    except Exception as e:
                        print(str(e))
                        flash(_('Error saving Crop Coordinates Data'), 'warning')
                        db.session.rollback()

            except Exception as e:
                print(str(e))
                flash(_('Error handling Crop Coordinates Data'), 'warning')
                db.session.rollback()

        flash(_('The crop <b>{name}</b> was successfully created').format(name=name), 'success')
            
        return redirect(url_for('crop.showCrop', crop_id=crop.id))

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


@crop.route("/weather_readings")
@login_required
def weather_readings():
    from SmartPlantCare.crop.txt_insert import create_plots
    from bokeh.resources import CDN
    import sqlite3
    import pandas as pd
    
    con=sqlite3.connect("C:/Users/nikos/Desktop/smart-plant-care/flask_crops_database.db", check_same_thread=False)
    df = pd.read_sql_query("SELECT * FROM monthly_weather",con)
    try:
        #result = subprocess.run(['python', 'SmartPlantCare/crop/get_weather_data.py'])
        result2 = subprocess.run(['python', 'SmartPlantCare/crop/txt_insert.py'])
        script, div = create_plots(df)
        resources = CDN.render() 
    except Exception as e:
        return render_template('404.html', error=str(e))  # Handle errors
    return render_template("weather_readings.html", owner=current_user,result2 = result2,script = script,div = div,resources=resources)


@crop.route("/crop/<int:crop_id>", methods=["GET"])
def showCrop(crop_id):

    crop = Crop.query.get_or_404(crop_id)
    name = crop.name
    lang_id = session.get('lang_id')
    prefecture = PrefectureName.query.filter_by(prefecture_id=crop.prefecture, language_id=lang_id).one_or_404()
    area = AreaName.query.filter_by(area_id=crop.area, language_id=lang_id).one_or_404()
    crop_type = CropTypeName.query.filter_by(crop_type_id=crop.crop_type, language_id=lang_id).one_or_404()
    soil_type = SoilTypeName.query.filter_by(soil_type_id=crop.soil_type, language_id=lang_id).one_or_404()
    crop_coordinates = CropCoordinates.query.filter(CropCoordinates.crop_id == crop_id).order_by(CropCoordinates.id.asc()).all()
    sensors = Sensor.query.filter_by(crop_id=crop_id).order_by(Sensor.id.asc()).all()
    form = newCropForm()

    map_html = False

    if len(crop_coordinates) > 0:
        try:
            # Convert in tuple list (longitude, latitude)
            crop_coordinates_list = [(coord.longtitute, coord.latitude) for coord in crop_coordinates]
            coordinates = json.loads(json.dumps(crop_coordinates_list))

        except Exception as e:
            print(str(e))
            flash(_('Exception: Invalid coordinates format. Expecting a list of [latitude, longitude] pairs.'), 'warning')

        if coordinates:
            map_html = create_map(coordinates, "layer_name", "red", "pink", 5, name)
        else:
            flash(_('ERROR: Invalid coordinates format. Expecting a list of [latitude, longitude] pairs.'), 'warning')
 
    return render_template("crop.html", form=form, crop=crop, map_html=map_html,
                           prefecture=prefecture, area=area, crop_type=crop_type,
                            soil_type=soil_type, sensors=sensors)


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
    crop_types = CropTypeName.query.filter_by(language_id=lang_id).order_by(CropTypeName.id.asc())
    soil_types = SoilTypeName.query.filter_by(language_id=lang_id).order_by(SoilTypeName.id.asc())
    crop_coordinates = CropCoordinates.query.filter(CropCoordinates.crop_id == crop_id).order_by(CropCoordinates.id.asc()).all()
    coordinates = ""

    if len(crop_coordinates) > 0:
        try:
            # Convert in tuple list (longitude, latitude)
            crop_coordinates_list = [(coord.longtitute, coord.latitude) for coord in crop_coordinates]
            coordinates = json.loads(json.dumps(crop_coordinates_list))
        except Exception as e:
            print(str(e))
            flash(_('Exception: Invalid coordinates format. Expecting a list of [latitude, longitude] pairs.'), 'warning')

    form = newCropForm(
        name = crop.name,
        location = crop.location,
        prefecture = crop.prefecture,
        area = crop.area,
        crop_size = crop.crop_size,
        crop_type = crop.crop_type,
        soil_type = crop.soil_type,
        crop_map = coordinates
        )

    if request.method == 'POST' and form.validate_on_submit():
        crop.name = form.name.data
        crop.location = form.location.data
        crop.prefecture = form.prefecture.data
        crop.area = form.area.data
        crop.crop_size = form.crop_size.data
        crop.crop_type = form.crop_type.data
        crop.soil_type = form.soil_type.data
        coordinates_type = form.coordinates_type.data

        # Map Data exists
        if len(form.crop_map.data) > 0:

            # Convert String to JSON            
            try:
                coordinates = json.loads(form.crop_map.data)

                # Settting for tranformation from EGSA87 (EPSG:2100) to WGS84 (EPSG:4326)
                transformer = Transformer.from_crs("epsg:2100", "epsg:4326", always_xy=False)
                            
                try:
                    # Delete previous Map Data
                    CropCoordinates.query.filter(CropCoordinates.crop_id == crop.id).delete()
                    #Add new Map Data
                    for crop_coords in coordinates:
                        lon, lat = crop_coords
                        if coordinates_type == "2100":
                            lon, lat = transformer.transform(lon, lat)
                        new_coord = CropCoordinates(crop_id=crop.id, longtitute=lon, latitude=lat)
                        db.session.add(new_coord)

                except Exception as e:
                    print(form.crop_map.data)
                    print(str(e))
                    flash(_('Error saving Crop Coordinates Data'), 'warning')
                    db.session.rollback()

            except Exception as e:
                print(form.crop_map.data)
                print(str(e))
                flash(_('Error handling Crop Coordinates Data'), 'warning')

        else:
            print("no map data")
            try:
                # Delete previous Map Data
                CropCoordinates.query.filter(CropCoordinates.crop_id == crop.id).delete()

            except Exception as e:
                db.session.rollback()
                print(str(e))
                flash(_('Error deleting Crop Coordinates Data'), 'warning')

        if form.image.data:
            try:
                image_file = save_image(app, form.image.data, 'crops_images', (640, 640))
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



