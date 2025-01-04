from flask import render_template, flash, redirect, url_for, request, session, abort
from flask_login import login_user, logout_user, login_required, \
    current_user
from flask_babel import _
from . import crop
#from .forms import RegistrationForm, LoginForm
#from SmartPlantCare.forms import NewCropForm
from .forms.newCropForm import newCropForm
from .models import Crop
from ..user.models import User
from .. import db
#from werkzeug.urls import url_parse

from SmartPlantCare import app

import secrets
from PIL import Image
import os

from datetime import datetime as dt

current_year = dt.now().year

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


@crop.route("/crops/")
def crops():

    ordering_by = request.args.get('ordering_by')

    ## Pagination: page value from 'page' parameter from url
    page = request.args.get('page', 1, type=int)

    if ordering_by==None:
        crops = Crop.query.order_by(Crop.id.asc()).paginate(per_page=5, page=page)
    elif ordering_by=='rating':
        crops = Crop.query.order_by(Crop.name.asc()).paginate(per_page=5, page=page)
    elif ordering_by=='release_year':
        crops = Crop.query.order_by(Crop.crop_area.desc()).paginate(per_page=5, page=page)
    else:
        return render_template('404.html'), 404

    return render_template("crops.html", crops=crops, ordering_by=ordering_by)


@crop.route("/new_crop/", methods=["GET", "POST"])
@login_required
def new_crop():
    form = newCropForm()
      
    if request.method == 'POST' and form.validate_on_submit():
        title = form.title.data
        plot = form.plot.data
        release_year = form.release_year.data
        rating = form.rating.data

        if form.image.data:
            try:
                image_file = image_save(form.image.data, 'crops_images', (640, 640))
            except:
                abort(415)
        
            crop = Crop(title=title,
                              plot=plot,
                              author=current_user,
                              image=image_file,
                              release_year=release_year,
                              rating=rating)
        else:
            crop = Crop(title=title, plot=plot, author=current_user, release_year=release_year, rating=rating)
        
        # Default values for testing START
        crop2 = Crop(title=crop.title, plot=crop.plot, author=crop.author, release_year=crop.release_year, rating=crop.rating, image=crop.image,
            name='testName',
            location='testLocation',
            location_longitude='testLong',
            location_latitude='testLat',
            prefecture=1,
            area=1,
            crop_area=1.1,
            crop_type=1,
            soil_type=1
                      )
        crop = crop2
        # END

        db.session.add(crop)
        db.session.commit()


        flash(_('The crop titled: {title} was successfully created').format(title=title), 'success')

        return redirect(url_for('crop.crops'))


    return render_template("new_crop.html", form=form, page_title=_('Αdd new Crop'), current_year=current_year)


### User crops list ###

@crop.route("/my_crops", methods=["GET"])
@login_required
def my_crops():

    ordering_by = request.args.get('ordering_by')
    page=1
    
    user = User.query.get_or_404(1)

    if ordering_by==None:
        crops = Crop.query.filter_by(author=current_user).order_by(Crop.id.asc()).paginate(per_page=3, page=page)
    elif ordering_by=='rating':
        crops = Crop.query.filter_by(author=current_user).order_by(Crop.name.asc()).paginate(per_page=3, page=page)
    elif ordering_by=='release_year':
        crops = Crop.query.filter_by(author=current_user).order_by(Crop.crop_area.desc()).paginate(per_page=3, page=page)
    else:
        return render_template('404.html'), 404

    return render_template("my_crops.html", crops=crops, author=current_user, ordering_by=ordering_by)


@crop.route("/crop/<int:crop_id>", methods=["GET"])
def showCrop(crop_id):

    crop = Crop.query.get_or_404(crop_id)
    form = newCropForm()

    return render_template("crop.html", form=form, crop=crop)


@crop.route("/crops_by_author/<int:author_id>")
def crops_by_author(author_id):
    

    ordering_by = request.args.get('ordering_by')

    ## Pagination: page value from 'page' parameter from url
    page = request.args.get('page', 1, type=int)
    
    user = User.query.get_or_404(author_id)

    if ordering_by==None:
        crops = Crop.query.filter_by(author=user).order_by(Crop.id.asc()).paginate(per_page=3, page=page)
    elif ordering_by=='rating':
        crops = Crop.query.filter_by(author=user).order_by(Crop.name.asc()).paginate(per_page=3, page=page)
    elif ordering_by=='release_year':
        crops = Crop.query.filter_by(author=user).order_by(Crop.crop_area.desc()).paginate(per_page=3, page=page)
    else:
        return render_template('404.html'), 404

    return render_template("crops_by_author.html", crops=crops, author=user, ordering_by=ordering_by)


@crop.route("/edit_crop/<int:crop_id>", methods=['GET', 'POST'])
@login_required
def edit_crop(crop_id):

    crop = Crop.query.filter_by(id=crop_id, author=current_user).first_or_404()


    form = newCropForm(title=crop.title, plot=crop.plot, release_year=crop.release_year, rating=crop.rating)

    if request.method == 'POST' and form.validate_on_submit():
        crop.title = form.title.data
        crop.plot = form.plot.data
        crop.release_year = form.release_year.data
        crop.rating = form.rating.data

        if form.image.data:
            try:
                image_file = image_save(form.image.data, 'crops_images', (640, 640))
            except:
                abort(415)

            crop.image = image_file

        db.session.commit()
    
        flash(_('The crop was successfully edited'), 'success')

        return redirect(url_for('crop.showCrop', crop_id=crop.id))

    return render_template("new_crop.html", form=form, crop=crop, page_title=_('Edit Crop'))


@crop.route("/delete_crop/<int:crop_id>", methods=["GET", "POST"])
@login_required
def delete_crop(crop_id):

    crop = Crop.query.filter_by(id=crop_id, author=current_user).first_or_404()

    if crop:

        db.session.delete(crop)
        db.session.commit()

        flash(_('The crop was successfully deleted.'), 'success')

        return redirect(url_for("crop.crops"))

    flash(_('The crop was not found.'), 'warning')

    return redirect(url_for('crop.crops'), form=form)
