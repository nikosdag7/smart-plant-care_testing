from flask import render_template, flash, request
#from flask import redirect, url_for, session, abort
#from flask_login import login_user, logout_user, login_required, current_user
from flask_babel import _
from . import irrigation
from .insert_bulletin_data import insert_bulletin_data
from .forms.newBulletin import newBulletin
from .forms.graphExample import graphExample
from .models import regionBulletin, regionBulletinData
from ..crop.models import Crop
from .. import db

from SmartPlantCare import app


@irrigation.route("/new_bulletin/", methods=['GET','POST'])
def new_bulletin():

    form = newBulletin()

    if request.method == 'POST' and form.validate_on_submit():
        start_date = form.start_date.data
        end_date = form.end_date.data   

        if request.method == "POST":
            if "file" not in request.files:
                flash(_('No CSV file part'), 'warning')
            
            file = request.files["file"]
            
            if file.filename == "":
                flash(_('No file uploaded'), 'warning')
            
            if file and file.filename.endswith(".csv"):

                content = file.read().decode('utf-8')
                insert_bulletin_data(content, start_date, end_date)
            else:
                flash(_('Only CSV files are allowed'), 'warning')

        flash(_('Bulletin data added (Date: from {start_date} to {end_date})').format(start_date=start_date, end_date=end_date), 'success')

    return render_template("newBulletin.html", form=form)

@irrigation.route("/graph_example/<int:crop_id>", methods=['GET','POST'])
def graph_example(crop_id):
    
    crop = Crop.query.get_or_404(crop_id)

    form = graphExample()

    if request.method == 'GET':
        return render_template("graph_example_form.html", crop=crop, form=form)
    elif request.method == 'POST' and form.validate_on_submit():

        start_date = form.start_date.data
        end_date = form.end_date.data

        graph_data = (
            db.session.query(regionBulletin.start_date, regionBulletinData.irrigation_need)
            .join(regionBulletin, regionBulletinData.bulletin == regionBulletin.id)
            .filter(regionBulletinData.area == crop.area,
                    regionBulletinData.crop_type==crop.crop_type,
                    regionBulletinData.soil_type==crop.soil_type,
                    regionBulletin.start_date >= start_date,
                    regionBulletin.end_date <= end_date
                    )
            .order_by(regionBulletin.start_date.asc())
            .all()
        )

        return render_template("graph_example.html", crop=crop, form=form, graph_data=graph_data)
