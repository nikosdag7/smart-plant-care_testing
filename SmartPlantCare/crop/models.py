from .. import db
from ..user.models import User
#from werkzeug.security import generate_password_hash, check_password_hash
#from .. import login
#from flask_login import UserMixin
#from ..models import Todo

#from SmartPlantCare import db
#from datetime import datetime

class Crop(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    location = db.Column(db.String(50), nullable=True)
    prefecture = db.Column(db.Integer, nullable=False, default=1)
    area = db.Column(db.Integer, nullable=False, default=1)
    crop_area = db.Column(db.Float, nullable=False)
    crop_type = db.Column(db.Integer, nullable=False, default=1)
    soil_type = db.Column(db.Integer, nullable=False, default=1)
    image = db.Column(db.String(40), nullable=True, default='default_crop_image.png')
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    cropcoords = db.relationship(
        'CropCoordinates', backref='cropc', lazy=True, cascade="all, delete-orphan"
    )

    def __repr__(self):
        return f"{self.id}:{self.name}:{self.crop_area}"

class CropCoordinates(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    longtitute = db.Column(db.Float, nullable=False)
    latitude = db.Column(db.Float, nullable=False)
    crop_id = db.Column(db.Integer, db.ForeignKey('crop.id'), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.crop_id}:{self.longtitute}:{self.latitude}"