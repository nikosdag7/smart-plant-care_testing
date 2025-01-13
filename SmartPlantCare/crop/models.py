from .. import db
from ..user.models import User
from sqlalchemy import PrimaryKeyConstraint, ForeignKeyConstraint, UniqueConstraint
#from werkzeug.security import generate_password_hash, check_password_hash
#from .. import login
#from flask_login import UserMixin
#from ..models import Todo

#from SmartPlantCare import db
#from datetime import datetime

class Prefecture(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    '''crops = db.relationship(
        'Crops', backref='prefecture_crops', lazy=True, cascade="all, delete-orphan"
    )'''

    def __repr__(self):
        return f"{self.id}"


class PrefectureName(db.Model):
    __table_args__ = (
        PrimaryKeyConstraint('id', name='prefecture_name_pk'),
        ForeignKeyConstraint(['prefecture_id'], ['prefecture.id']),
        ForeignKeyConstraint(['language_id'], ['language.id']),
        UniqueConstraint('prefecture_id', 'language_id', name='prefecture_name_unique')  # Composite Unique Constraint
    )
    id = db.Column(db.Integer, primary_key=True)
    prefecture_id = db.Column(db.Integer, db.ForeignKey('prefecture.id'), nullable=False) 
    language_id = db.Column(db.Integer, db.ForeignKey('language.id'), nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.prefecture_id}:{self.language_id}:{self.name}"


class Area(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    prefecture_id = db.Column(db.Integer, db.ForeignKey('prefecture.id'), nullable=False)
    '''crops = db.relationship(
        'Crops', backref='area_crops', lazy=True, cascade="all, delete-orphan"
    )'''

    def __repr__(self):
        return f"{self.id}"


class AreaName(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    area_id = db.Column(db.Integer, db.ForeignKey('area.id'), nullable=False) 
    language_id = db.Column(db.Integer, db.ForeignKey('language.id'), nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.area_id}:{self.language_id}:{self.name}"


class CropType(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    '''crops = db.relationship(
        'Crops', backref='crop_type_crops', lazy=True, cascade="all, delete-orphan"
    )'''

    def __repr__(self):
        return f"{self.id}"


class CropTypeName(db.Model):
    __table_args__ = (
        PrimaryKeyConstraint('id', name='crop_type_name_pk'),
        ForeignKeyConstraint(['crop_type_id'], ['crop_type.id']),
        ForeignKeyConstraint(['language_id'], ['language.id']),
        UniqueConstraint('crop_type_id', 'language_id', name='crop_type_name_unique')  # Composite Unique Constraint
    )
    id = db.Column(db.Integer, primary_key=True)
    crop_type_id = db.Column(db.Integer, db.ForeignKey('crop_type.id'), nullable=False) 
    language_id = db.Column(db.Integer, db.ForeignKey('language.id'), nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.crop_type_id}:{self.language_id}:{self.name}"


class SoilType(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    '''crops = db.relationship(
        'Crops', backref='soil_type_crops', lazy=True, cascade="all, delete-orphan"
    )'''

    def __repr__(self):
        return f"{self.id}"


class SoilTypeName(db.Model):
    __table_args__ = (
        PrimaryKeyConstraint('id', name='soil_type_name_pk'),
        ForeignKeyConstraint(['soil_type_id'], ['soil_type.id']),
        ForeignKeyConstraint(['language_id'], ['language.id']),
        UniqueConstraint('soil_type_id', 'language_id', name='soil_type_name__unique')  # Composite Unique Constraint
    )
    id = db.Column(db.Integer, primary_key=True)
    soil_type_id = db.Column(db.Integer, db.ForeignKey('soil_type.id'), nullable=False) 
    language_id = db.Column(db.Integer, db.ForeignKey('language.id'), nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.soil_type_id}:{self.language_id}:{self.name}"


class Crop(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(50), nullable=False)
    location = db.Column(db.String(50), nullable=True)
    prefecture = db.Column(db.Integer, db.ForeignKey('prefecture.id'), nullable=False)
    area = db.Column(db.Integer, db.ForeignKey('area.id'), nullable=False)
    crop_size = db.Column(db.Float, nullable=False)
    crop_type = db.Column(db.Integer, nullable=False, default=1)
    soil_type = db.Column(db.Integer, nullable=False, default=1)
    image = db.Column(db.String(40), nullable=True, default='default_crop_image.png')
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    cropcoords = db.relationship(
        'CropCoordinates', backref='cropc', lazy=True, cascade="all, delete-orphan"
    )

    def __repr__(self):
        return f"{self.id}:{self.name}:{self.crop_size}"

class CropCoordinates(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    crop_id = db.Column(db.Integer, db.ForeignKey('crop.id'), nullable=False)
    longtitute = db.Column(db.Float, nullable=False)
    latitude = db.Column(db.Float, nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.crop_id}:{self.longtitute}:{self.latitude}"