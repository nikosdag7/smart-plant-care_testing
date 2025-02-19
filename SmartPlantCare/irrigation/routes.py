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
from .import irrigation
from .insert_bulletin_data import insert_bulletin_data
from .forms.newBulletin import newBulletin
from .forms.graphExample import graphExample
from .models import regionBulletin, regionBulletinData
from ..crop.models import Crop
#from .models import regionData
#from ..crop.models import Prefecture, PrefectureName, Area, AreaName, CropType, CropTypeName, SoilType, SoilTypeName
from .. import db
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

@irrigation.route("/graph_example/<int:crop_id>", methods=['GET','POST'])
def graph_example(crop_id):
    from bokeh.plotting import figure
    from bokeh.embed import components
    from bokeh.resources import CDN
    from bokeh.models import ColumnDataSource,HoverTool
    crop = Crop.query.get_or_404(crop_id)


    form = graphExample()

    if request.method == 'GET':
        return render_template("graph_example_form.html", crop=crop, form=form)
    elif request.method == 'POST' and form.validate_on_submit():

        start_date = form.start_date.data
        end_date = form.end_date.data

        graph_data = (
            db.session.query(regionBulletin.start_date, regionBulletinData.irrigation_need,regionBulletinData.irrigation_dose)
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
    date = [i[0] for i in graph_data]
    need = [i[1] for i in graph_data]
    dose = [i[2] for i in graph_data]
    
    p = figure(title = "Άρδευση", x_axis_label = "Ημερομηνία",x_axis_type = "datetime", y_axis_label = "Ανάγκες σε Νερό (κ.μ./στρ.)",width = 600, height = 350)
    source = ColumnDataSource(data=dict(
        x = date,
        y1 = need,
        y2 = dose,
    ))

    hover_tool = HoverTool(
        tooltips = [
        ('Ημερομηνία', '@x{%F}'),
        ('Ανάγκη για νερό', '@y1{0.0}'),
        ('Δόση σε νερό', '@y2{0.0}')
        ],
        formatters={
            '@x' : 'datetime'
        },
        mode = "mouse"
    )

    p.line('x','y1', legend_label = "Ανάγκη σε νερό",color ='red', line_width =3,source = source)
    p.line('x','y2', legend_label = "Δόση νερού",color = 'yellow', line_width =3, source = source)
    p.add_tools(hover_tool)
    script, div = components(p)
    resources = CDN.render() 

    return render_template("graph_example.html", crop=crop, form=form, graph_data=graph_data,resources=resources,script=script,div=div)