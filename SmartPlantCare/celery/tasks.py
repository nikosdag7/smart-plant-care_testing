from celery import shared_task
from datetime import datetime
from sqlalchemy.orm import sessionmaker
from ..celery.email_notifier import EmailNotifier


@shared_task
def check_sensor_data_thresholds():
    from .. import celery
    from ..user.models import User
    from ..alert.models import Alert
    from ..sensor.models import Sensor, SensorData
    from ..crop.models import Crop
    from .. import db
    from .. import app

    #sensor settings
    MOISTURE_SENSOR_THRESHOLD_MAX = app.config['MOISTURE_SENSOR_THRESHOLD_MAX']
    MOISTURE_SENSOR_THRESHOLD_MIN = app.config['MOISTURE_SENSOR_THRESHOLD_MIN']

    notifier = EmailNotifier(
        app.config['NOTIFICATION_SENDER_EMAIL_ADDRESS'],
        app.config['NOTIFICATION_EMAIL_PASSWORD'],
        app.config['NOTIFICATION_SMTP_SERVER'],
        app.config['NOTIFICATION_SMTP_SERVER_PORT']
        )

    print("Alert-Notification Daemon(task) periodic execution.")

    #session = db.session
    #db.session.autoflush = False

    try:
        # Get all crops
        crops =  db.session.query(Crop).all()

        for crop in crops:
            # Get the latest sensor data for the crop
            latest_sensor_data = (
                db.session.query(SensorData)
                .join(Sensor, SensorData.sensor_id == Sensor.id)
                .filter(Sensor.crop_id == crop.id, SensorData.processed==False)
                .order_by(SensorData.date_time.desc())
                .first()
            )
            print("##### latest_sensor_data #####")
            print(latest_sensor_data)
            # Check if the latest sensor value exceeds the threshold
            if latest_sensor_data and (
                latest_sensor_data.value < MOISTURE_SENSOR_THRESHOLD_MIN
                or latest_sensor_data.value > MOISTURE_SENSOR_THRESHOLD_MAX):
                # Get the user associated with the crop
                user = db.session.query(User).filter_by(id=crop.user_id).first()
                if user:
                    recipient_email = user.email

                    # Create an alert
                    alert = Alert(
                        crop_id=crop.id,
                        threshold_type="sensor_value",
                        threshold_value=latest_sensor_data.value,
                        action_taken="Send notification email for threshold exceeded",
                        timestamp=datetime.utcnow(),
                    )
                    db.session.add(alert)

                    # Send email notification
                    subject = "SmartPlantCare Alert Notification"
                    body = f"Alert for your crop {crop.name}: Sensor value {latest_sensor_data.value} exceeded the threshold."
                    notifier.send_email(recipient_email, subject, body)

                    print(f"Email sent to: {recipient_email}")
                    print(f"Alert for crop: {crop.name} with sensor value: {latest_sensor_data.value}")

                    # Mark the sensor data as processed
                    latest_sensor_data.processed = True

        # Commit the session
        db.session.commit()
    except Exception as e:
        print(f"An error occurred: {e}")
        db.session.rollback()
    finally:
        db.session.close()