from sqlalchemy import PrimaryKeyConstraint, ForeignKeyConstraint
#from sqlalchemy import UniqueConstraint
from datetime import datetime
from .. import db

class Sensor(db.Model):
    __tablename__ = 'sensor'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='sensor_pk'),
        ForeignKeyConstraint(['crop_id'], ['crop.id'])        
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    loc_longtitute = db.Column(db.Float, nullable=False)
    loc_latitude = db.Column(db.Float, nullable=False)
    crop_id = db.Column(db.Integer, db.ForeignKey('crop.id'), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.crop_id}:{self.loc_longtitute}:{self.loc_latitude}"

class SensorData(db.Model):
    __tablename__ = 'sensor_data'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='sensor_data_pk'),
        ForeignKeyConstraint(['sensor_id'], ['sensor.id'])        
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    date_time = db.Column(db.DateTime, nullable=True, default=datetime.utcnow)
    value = db.Column(db.Float, nullable=False)
    sensor_id = db.Column(db.Integer, db.ForeignKey('sensor.id'), nullable=False)
    processed = db.Column(db.Boolean, nullable=False, default=False)
    def __repr__(self):
        return f"{self.id}:{self.sensor_id}"
