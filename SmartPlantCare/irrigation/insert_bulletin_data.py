import csv
from io import StringIO
from .. import db
from .models import regionBulletin, regionBulletinData
from ..crop.models import PrefectureName, AreaName, CropTypeName, SoilTypeName

def insert_bulletin_data(content, start_date, end_date):

    reader = csv.DictReader(StringIO(content))
    try:

        region_bulletin_row = regionBulletin(start_date = start_date, end_date = end_date)
        db.session.add(region_bulletin_row)
        db.session.commit()
        new_id = region_bulletin_row.id

        # Read cvs File rows
        for row in reader:
            prefecture =  PrefectureName.query.filter_by(language_id=2, name=row['Νομός']).first()
            area = AreaName.query.filter_by(language_id=2, name=row['Περιοχή']).first()
            crop_type = CropTypeName.query.filter_by(language_id=2, name=row['Καλλιέργεια']).first()
            soil_type = SoilTypeName.query.filter_by(language_id=2, name=row['Έδαφος']).first()

            bulletin_data_row = regionBulletinData(
                bulletin = new_id,
                prefecture = prefecture.prefecture_id,
                area = area.area_id,
                crop_type = crop_type.crop_type_id,
                soil_type = soil_type.soil_type_id,
                irrigation_need = row['Ανάγκες σε νερό (κ.μ./στρ.)'],
                irrigation_number = row['Αριθμός Αρδεύσεων'],
                irrigation_dose = row['Δόση Άρδευσης (κ.μ./στρ.)']
            )

            db.session.add(bulletin_data_row)
        db.session.commit()

    except Exception as e:
        print(str(e))
        db.session.rollback()
