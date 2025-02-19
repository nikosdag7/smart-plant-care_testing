from flask_wtf import FlaskForm
from flask_babel import _
from wtforms import StringField, SubmitField, ValidationError
from wtforms.validators import DataRequired, Length, Email, EqualTo
import phonenumbers
from ..models import User

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
            

class signupForm(FlaskForm):
    username = StringField(label=_('Username'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       Length(min=3, max=15, message=_('This field must be between 3 and 15 characters'))])

    email = StringField(label=_('Email'),
                           validators=[DataRequired(message=_('This field cannot be empty.')), 
                                       Email(message=_('Please enter a valid email address')), validate_email])

    mobile = StringField(label=_('Mobile (+30)'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       Length(min=10, max=10, message=_('This field must be 10 characters')),
                                       validate_mobile])

    password = StringField(label=_('Password'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       Length(min=3, max=15, message=_('This field must be between 3 and 15 characters'))])
    
    password2 = StringField(label=_('Confirm password'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       Length(min=3, max=15, message=_('This field must be between 3 and 15 characters')),
                                       EqualTo('password', message=_('The two password fields must be the same'))])
    
    submit = SubmitField(_('Signup'))


    def validate_username(self, username):
      user = User.query.filter_by(username=username.data).first()
      if user:
         raise ValidationError(_('This email already exists!'))