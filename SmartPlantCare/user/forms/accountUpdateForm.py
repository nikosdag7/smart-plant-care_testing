from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from wtforms import StringField, SubmitField, ValidationError
from wtforms.validators import DataRequired, Length, Email, Optional
from flask_login import current_user
from flask_babel import _
from datetime import datetime as dt
import phonenumbers 
from ..models import User

current_year = dt.now().year

### Custom Validation function outside the form class ###
def maxImageSize(max_size=2):
    max_bytes = max_size * 1024 * 1024
    def _check_file_size(form, field):
        if len(field.data.read()) > max_bytes:
            raise ValidationError(_('The size of the image cannot exceed {max_size} MB').format(max_size=max_size))

    return _check_file_size


### Validation function outside the form class ###
def validate_email(form, email):
    user = User.query.filter_by(email=email.data).first()
    if user:
        raise ValidationError(_('This email already exists!'))

### Validation mobile ###
def validate_mobile(form, mobile):
    if len(mobile.data) != 10:
        raise ValidationError(_('Invalid phone number.'))
    try:
        input_number = phonenumbers.parse("+30"+mobile.data)
        if not (phonenumbers.is_valid_number(input_number)):
            raise ValidationError('Invalid phone number.')
    except:
        raise ValidationError('Invalid phone number.')

class accountUpdateForm(FlaskForm):
    username = StringField(label=_('Username'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       Length(min=3, max=15, message=_('This field must be between 3 and 15 characters'))])

    email = StringField(label=_('Email'),
                           validators=[DataRequired(message=_('This field cannot be empty.')), 
                                       Email(message=_('Please enter a valid email address'))])

    mobile = StringField(label=_('Mobile (+30)'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       Length(min=10, max=10, message=_('This field must be 10 characters')),
                                       validate_mobile])

    profile_image = FileField(_('Crop image'), validators=[Optional(strip_whitespace=True),
                                                           FileAllowed([ 'jpg', 'jpeg', 'png' ],
                                                            _('Only jpg, jpeg and png image files are allowed!')),
                                                           maxImageSize(max_size=2)])
   
    submit = SubmitField(_('Submit'))

    def validate_username(self, username):
        if username.data != current_user.username:
            user = User.query.filter_by(username=username.data).first()
            if user:
                raise ValidationError(_('This username already exists!'))      

    def validate_email(self, email):
        if email.data != current_user.email:
            user = User.query.filter_by(email=email.data).first()
            if user:
                raise ValidationError(_('This email already exists!'))
