from .. import db
#from ..crop.models import Prefecture, Area, CropType, SoilType
from sqlalchemy import PrimaryKeyConstraint, ForeignKeyConstraint, UniqueConstraint
from datetime import datetime

class regionData(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    start_date = db.Column(db.DateTime, default='1/1/2000', nullable=False)
    end_date = db.Column(db.DateTime, default='1/1/2000', nullable=False)
    prefecture = db.Column(db.Integer, db.ForeignKey('prefecture.id'), nullable=False)
    area = db.Column(db.Integer, db.ForeignKey('area.id'), nullable=False)
    crop_type = db.Column(db.Integer, db.ForeignKey('crop_type.id'), nullable=False)
    soil_type = db.Column(db.Integer, db.ForeignKey('soil_type.id'), nullable=False)
    irrigation_need = db.Column(db.Float, nullable=False)
    irrigation_number = db.Column(db.Integer, nullable=False)
    irrigation_dose = db.Column(db.Float, nullable=False)