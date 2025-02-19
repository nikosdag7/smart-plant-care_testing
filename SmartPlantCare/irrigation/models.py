from .. import db
from sqlalchemy import PrimaryKeyConstraint, ForeignKeyConstraint, UniqueConstraint

class regionBulletin(db.Model):
    __tablename__ = 'region_bulletin'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='region_bulletin_pk'),
        UniqueConstraint('start_date', 'end_date', name='region_bulletin_unique')  # Composite Unique Constraint
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    start_date = db.Column(db.DateTime, default='1/1/2000', nullable=False)
    end_date = db.Column(db.DateTime, default='1/1/2000', nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.start_date}:{self.end_date}"
    
class regionBulletinData(db.Model):
    __tablename__ = 'region_bulletin_data'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='region_bulletin_data_pk'),
        ForeignKeyConstraint(['prefecture'], ['prefecture.id']),
        ForeignKeyConstraint(['area'], ['area.id']),
        ForeignKeyConstraint(['crop_type'], ['crop_type.id']),
        ForeignKeyConstraint(['soil_type'], ['soil_type.id'])        
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    bulletin = db.Column(db.Integer, db.ForeignKey('region_bulletin.id'), nullable=False)
    prefecture = db.Column(db.Integer, db.ForeignKey('prefecture.id'), nullable=False)
    area = db.Column(db.Integer, db.ForeignKey('area.id'), nullable=False)
    crop_type = db.Column(db.Integer, db.ForeignKey('crop_type.id'), nullable=False)
    soil_type = db.Column(db.Integer, db.ForeignKey('soil_type.id'), nullable=False)
    irrigation_need = db.Column(db.Float, nullable=False)
    irrigation_number = db.Column(db.Integer, nullable=False)
    irrigation_dose = db.Column(db.Float, nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.bulletin}:{self.prefecture}"
