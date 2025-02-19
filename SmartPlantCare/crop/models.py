from .. import db
from ..user.models import User
from sqlalchemy import PrimaryKeyConstraint, ForeignKeyConstraint, UniqueConstraint
from sqlalchemy.orm import relationship
#from werkzeug.security import generate_password_hash, check_password_hash
#from .. import login
#from flask_login import UserMixin
#from ..models import Todo

#from SmartPlantCare import db
#from datetime import datetime

class Prefecture(db.Model):
    __tablename__ = 'prefecture'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='prefecture_pk'),
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    '''crops = db.relationship(
        'Crops', backref='prefecture_crops', lazy=True, cascade="all, delete-orphan"
    )'''

    def __repr__(self):
        return f"{self.id}"


class PrefectureName(db.Model):
    __tablename__ = 'prefecture_name'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='prefecture_name_pk'),
        ForeignKeyConstraint(['prefecture_id'], ['prefecture.id']),
        ForeignKeyConstraint(['language_id'], ['language.id']),
        UniqueConstraint('prefecture_id', 'language_id', name='prefecture_name_unique')  # Composite Unique Constraint
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    prefecture_id = db.Column(db.Integer, db.ForeignKey('prefecture.id'), nullable=False) 
    language_id = db.Column(db.Integer, db.ForeignKey('language.id'), nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.prefecture_id}:{self.language_id}:{self.name}"


class Area(db.Model):
    __tablename__ = 'area'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='area_pk'),
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    prefecture_id = db.Column(db.Integer, db.ForeignKey('prefecture.id'), nullable=False)
    '''crops = db.relationship(
        'Crops', backref='area_crops', lazy=True, cascade="all, delete-orphan"
    )'''

    def __repr__(self):
        return f"{self.id}"


class AreaName(db.Model):
    __tablename__ = 'area_name'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='area_name_pk'),
        ForeignKeyConstraint(['prefecture_id'], ['prefecture.id']),
        ForeignKeyConstraint(['area_id'], ['area.id']),
        ForeignKeyConstraint(['language_id'], ['language.id']),
        UniqueConstraint('prefecture_id', 'area_id', 'language_id', name='area_name_unique')  # Composite Unique Constraint
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    prefecture_id = db.Column(db.Integer, db.ForeignKey('prefecture.id'), nullable=False)
    area_id = db.Column(db.Integer, db.ForeignKey('area.id'), nullable=False) 
    language_id = db.Column(db.Integer, db.ForeignKey('language.id'), nullable=False)
    name = db.Column(db.String(200), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.area_id}:{self.language_id}:{self.name}"


class CropType(db.Model):
    __tablename__ = 'crop_type'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='crop_type_pk'),
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    '''crops = db.relationship(
        'Crops', backref='crop_type_crops', lazy=True, cascade="all, delete-orphan"
    )'''

    def __repr__(self):
        return f"{self.id}"


class CropTypeName(db.Model):
    __tablename__ = 'crop_type_name'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='crop_type_name_pk'),
        ForeignKeyConstraint(['crop_type_id'], ['crop_type.id']),
        ForeignKeyConstraint(['language_id'], ['language.id']),
        UniqueConstraint('crop_type_id', 'language_id', name='crop_type_name_unique')  # Composite Unique Constraint
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    crop_type_id = db.Column(db.Integer, db.ForeignKey('crop_type.id'), nullable=False) 
    language_id = db.Column(db.Integer, db.ForeignKey('language.id'), nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.crop_type_id}:{self.language_id}:{self.name}"


class SoilType(db.Model):
    __tablename__ = 'soil_type'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='soil_type_pk'),
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    '''crops = db.relationship(
        'Crops', backref='soil_type_crops', lazy=True, cascade="all, delete-orphan"
    )'''

    def __repr__(self):
        return f"{self.id}"


class SoilTypeName(db.Model):
    __tablename__ = 'soil_type_name'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='soil_type_name_pk'),
        ForeignKeyConstraint(['soil_type_id'], ['soil_type.id']),
        ForeignKeyConstraint(['language_id'], ['language.id']),
        UniqueConstraint('soil_type_id', 'language_id', name='soil_type_name_unique')  # Composite Unique Constraint
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    soil_type_id = db.Column(db.Integer, db.ForeignKey('soil_type.id'), nullable=False) 
    language_id = db.Column(db.Integer, db.ForeignKey('language.id'), nullable=False)
    name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.soil_type_id}:{self.language_id}:{self.name}"


class Crop(db.Model):
    __tablename__ = 'crop'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='crop_pk'),
        ForeignKeyConstraint(['prefecture'], ['prefecture.id']),
        ForeignKeyConstraint(['area'], ['area.id']),
        ForeignKeyConstraint(['crop_type'], ['crop_type.id']),
        ForeignKeyConstraint(['soil_type'], ['soil_type.id'])
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(50), nullable=False)
    location = db.Column(db.String(50), nullable=True)
    prefecture = db.Column(db.Integer, db.ForeignKey('prefecture.id'), nullable=False)
    area = db.Column(db.Integer, db.ForeignKey('area.id'), nullable=False)
    crop_size = db.Column(db.Float, nullable=False)
    crop_type = db.Column(db.Integer, db.ForeignKey('crop_type.id'), nullable=False, default=1)
    soil_type = db.Column(db.Integer, db.ForeignKey('soil_type.id'), nullable=False, default=1)
    image = db.Column(db.String(40), nullable=True, default='default_crop_image.png')
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    cropcoords = db.relationship(
        'CropCoordinates', backref='cropc', lazy=True, cascade="all, delete-orphan"
    )

    # Add this relationship to connect Crop to Alert
    alerts = relationship('Alert', back_populates='crop')

    def __repr__(self):
        return f"{self.id}:{self.name}:{self.crop_size}"

class CropCoordinates(db.Model):
    __tablename__ = 'crop_coordinates'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='crop_coordinates_pk'),
        ForeignKeyConstraint(['crop_id'], ['crop.id'])
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    crop_id = db.Column(db.Integer, db.ForeignKey('crop.id'), nullable=False)
    longtitute = db.Column(db.Float, nullable=False)
    latitude = db.Column(db.Float, nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.crop_id}:{self.longtitute}:{self.latitude}"
