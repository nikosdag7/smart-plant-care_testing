import os
basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    SECRET_KEY = os.environ['SECRET_KEY']
    WTF_CSRF_ENABLED = True
    WTF_CSRF_SECRET_KEY = os.environ['WTF_CSRF_SECRET_KEY']
    SQLALCHEMY_DATABASE_URI = os.environ.get('SQLALCHEMY_DATABASE_URI') or 'sqlite:///' + os.path.join(basedir, 'flask_crops_database.db')
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    LANGUAGES = ['el', 'en']  # Support Greek and English language
    # celery settings
    CELERY_TIMEDELTA = os.environ.get('CELERY_TIMEDELTA') or 300 #30 sec, 300/5min, 43200/12hours
    CELERY_WORKER_CMD = ["celery", "-A", "SmartPlantCare.celery", "worker", "--loglevel=info"]
    CELERY_BEAT_CMD = ["celery", "-A", "SmartPlantCare.celery", "beat", "--loglevel=info"]
    RESULT_BACKEND = os.environ.get('RESULT_BACKEND') or 'db+sqlite:///' + os.path.join(basedir, 'alert_results.db')
    BROKER = os.environ.get('BROKER') or 'sqla+sqlite:///' + os.path.join(basedir, 'alert_tasks.db')
    # email notifications
    NOTIFICATION_SENDER_EMAIL_ADDRESS = os.environ['NOTIFICATION_SENDER_EMAIL_ADDRESS']
    NOTIFICATION_EMAIL_PASSWORD = os.environ['NOTIFICATION_EMAIL_PASSWORD']
    NOTIFICATION_SMTP_SERVER = os.environ.get('NOTIFICATION_SMTP_SERVER') or 'smtp.gmail.com'
    NOTIFICATION_SMTP_SERVER_PORT = os.environ.get('NOTIFICATION_SMTP_SERVER_PORT') or '587'
    # sensor Settings
    MOISTURE_SENSOR_THRESHOLD_MAX = 40
    MOISTURE_SENSOR_THRESHOLD_MIN = 10
