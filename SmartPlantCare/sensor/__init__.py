from flask import Blueprint

sensor = Blueprint('sensor', __name__, template_folder='templates')

from . import models, routes
