from flask import render_template, flash, redirect, url_for, request, session, abort
from flask_login import login_user, logout_user, login_required, current_user
from flask_babel import _
from . import sensor
from .models import Sensor, SensorData
from ..crop.models import Crop
from SmartPlantCare import app


@sensor.route("/get_sensor_data/<int:sensor_id>", methods=['GET'])
@login_required
def get_sensor_data(sensor_id):

    sensor = Sensor.query.get_or_404(sensor_id)
    crop = Crop.query.get_or_404(sensor.crop_id)

    sensor_data = 3.2 # Dummy value

    return render_template("sensor_data.html", crop=crop, sensor=sensor, sensor_data=sensor_data)