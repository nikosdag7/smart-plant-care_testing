from config import Config
from flask import Flask, session, request
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_wtf.csrf import CSRFProtect
from flask_babel import Babel, _
from flask_bcrypt import Bcrypt

# set up babel
def get_locale():
    return session.get('lang', request.accept_languages.best_match(
            app.config['LANGUAGES']) or app.config['LANGUAGES'][0])

app = Flask(__name__)
app.config.from_object(Config)
bcrypt = Bcrypt(app)
csrf = CSRFProtect()
babel = Babel()


db = SQLAlchemy(app)
#migrate = Migrate(app, db)
csrf.init_app(app)
babel.init_app(app, locale_selector=get_locale)
login_manager = LoginManager(app)
login_manager.login_view = 'user.login_page'
login_manager.login_message_category = 'warning'
login_manager.login_message = _('Please login to be able to view this page.')

#celery setup
from .celery_app import make_celery
celery=make_celery(app)

# blueprint for auth routes
from .user import user as user_bp
app.register_blueprint(user_bp)

# blueprint for parts of app
from .crop import crop as crop_bp
app.register_blueprint(crop_bp)

# blueprint for parts of app
from .sensor import sensor as sensor_bp
app.register_blueprint(sensor_bp)

# blueprint for parts of app
from .irrigation import irrigation as irrigation_bp
app.register_blueprint(irrigation_bp)

#from SmartPlantCare import routes, models
from SmartPlantCare import routes

# blueprint for parts of app
from .alert import alert as alert_bp
app.register_blueprint(alert_bp)
import SmartPlantCare.celery.tasks #import tasks to be able to register them.
#from SmartPlantCare import routes, models


#write ahead logging for better concurrency
# WAL setup
from sqlalchemy import text
"""
@app.before_request
def before_request_setup():
    with app.app_context():
        # Accessing the database connection correctly and wrapping the query with text()
        with db.session.begin():
            db.session.execute(text('PRAGMA journal_mode = WAL'))
            print("WAL mode set for SQLite.")
"""
