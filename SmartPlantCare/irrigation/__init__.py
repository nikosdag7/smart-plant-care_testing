from flask import Blueprint

irrigation = Blueprint('irrigation', __name__, template_folder='templates')

from . import routes
from . import models