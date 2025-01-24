import csv
from io import StringIO
from .. import db
from .models import regionData
from ..crop.models import PrefectureName, AreaName, CropTypeName, SoilTypeName

def insert_bulletin_data(content, start_date, end_date):

    reader = csv.DictReader(StringIO(content))
    #print("reader")
    #print(reader)
    for row in reader:
        #print("row")
        #print(row)
        prefecture =  PrefectureName.query.filter_by(language_id=2, name=row['Νομός']).first()
        #print('Νομός={name}, id={id}'.format(name=row['Νομός'],id=prefecture.prefecture_id))
        area = AreaName.query.filter_by(language_id=2, name=row['Περιοχή']).first()
        #print('Περιοχή={name}, id={id}'.format(name=row['Περιοχή'],id=area.area_id))
        crop_type = CropTypeName.query.filter_by(language_id=2, name=row['Καλλιέργεια']).first()
        #print('Καλλιέργεια={name}, id={id}'.format(name=row['Καλλιέργεια'],id=crop_type.crop_type_id))
        soil_type = SoilTypeName.query.filter_by(language_id=2, name=row['Έδαφος']).first()
        #print('Έδαφος={name}, id={id}'.format(name=row['Έδαφος'],id=soil_type.soil_type_id))

        bulletin_row = regionData(
            start_date = start_date,
            end_date = end_date,
            prefecture = prefecture.prefecture_id,
            area = area.area_id,
            crop_type = crop_type.crop_type_id,
            soil_type = soil_type.soil_type_id,
            irrigation_need = row['Ανάγκες σε νερό (κ.μ./στρ.)'],
            irrigation_number = row['Αριθμός Αρδεύσεων'],
            irrigation_dose = row['Δόση Άρδευσης (κ.μ./στρ.)']
        )
        """print(
            bulletin_row.start_date,
            bulletin_row.end_date,
            bulletin_row.prefecture,
            bulletin_row.area,
            bulletin_row.crop_type,
            bulletin_row.soil_type,
            bulletin_row.irrigation_need,
            bulletin_row.irrigation_number,
            bulletin_row.irrigation_dose
            )"""

        db.session.add(bulletin_row)
    db.session.commit()