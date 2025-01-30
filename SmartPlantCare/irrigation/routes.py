#from pickle import FALSE
#from tokenize import String
#import csv
#import pandas as pd
#from io import StringIO
#import io
#import os
#import tempfile
from flask import render_template, flash, redirect, url_for, request, session, abort
from flask_login import login_user, logout_user, login_required, current_user
from flask_babel import _
from . import irrigation
from .insert_bulletin_data import insert_bulletin_data
from .forms.newBulletin import newBulletin
#from .models import regionData
#from ..crop.models import Prefecture, PrefectureName, Area, AreaName, CropType, CropTypeName, SoilType, SoilTypeName
#from .. import db, bcrypt
#import os
#from datetime import datetime as dt

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