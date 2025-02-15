from .. import db
from sqlalchemy import PrimaryKeyConstraint, ForeignKeyConstraint
#from sqlalchemy import UniqueConstraint
from sqlalchemy.orm import relationship
from datetime import datetime

##class describing a generated alert
class Alert(db.Model):
    __tablename__ = 'alert'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='alert_pk'),
        ForeignKeyConstraint(['crop_id'], ['crop.id'])
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    crop_id = db.Column(db.Integer, db.ForeignKey('crop.id'), nullable=False)
    threshold_type = db.Column(db.String(50), nullable=False)  # 
    threshold_value = db.Column(db.Float, nullable=False)  # 
    action_taken = db.Column(db.String(100), nullable=False)  # What action was taken(email etc)
    timestamp = db.Column(db.DateTime, default=datetime.utcnow)

    crop = db.relationship('Crop', back_populates='alerts')

    def __repr__(self):
        return f"Alert for Crop {self.crop_id} (Threshold: {self.threshold_type} exceeded)"

