# smart-plant-care
SmartPlantCare repository

## Run mini How To

### Clone repository
git clone https://github.com/grigoris-hmu/smart-plant-care.git<br/>
cd smart-plant-care/

### Initialize Python virtual enviroment
python3 -m virtualenv .venv<br/>
source .venv/bin/activate

### Install dependencies
pip install -r requirements.txt

### Set enviroment variables (used in SmartPlantCare/__init__.py)
export SECRET_KEY='use_a_strong_string'<br/>
export WTF_CSRF_SECRET_KEY='use_a_strong_string'<br/>
export SQLALCHEMY_DATABASE_URI='use_the_database_credentials'<br/>

### Run app locally (Running on http://127.0.0.1:5000)
python3 app.py

# Flask-Babel mini How To

### Create .pot file
pybabel extract -F babel.cfg -o messages.pot .

### Create .po file for Greek language
pybabel init -i messages.pot -d SmartPlantCare/translations -l el

### Translate .po file

### Create binary .mo files
pybabel compile -d SmartPlantCare/translations

## Flask-Babel Documentation
https://python-babel.github.io/flask-babel/
