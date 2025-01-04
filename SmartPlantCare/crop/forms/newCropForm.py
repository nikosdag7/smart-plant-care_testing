from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from flask_babel import _
from wtforms import StringField, SubmitField, BooleanField, TextAreaField, IntegerField
#from wtforms.validators import DataRequired, Email, Length, EqualTo, ValidationError, Optional, NumberRange
from wtforms.validators import DataRequired, Length, EqualTo, ValidationError, Optional, NumberRange
#from SmartPlantCare.models import User
#from flask_login import current_user

from datetime import datetime as dt


current_year = dt.now().year


#Custom Validation function outside the form class
def maxImageSize(max_size=2):
    max_bytes = max_size * 1024 * 1024
    def _check_file_size(form, field):
        if len(field.data.read()) > max_bytes:
            raise ValidationError(_('The size of the image cannot exceed {max_size} MB').format(max_size=max_size))

    return _check_file_size


class newCropForm(FlaskForm):
    title = StringField(label=_('Crop Title'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       Length(min=3, max=50, message=_('This field must be between {min} and {max} characters').format(min=3,max=50))])


    plot = TextAreaField(label=_('Crop plot'),
                           validators=[DataRequired(message=_('This field cannot be empty.')), 
                                       Length(min=5, message=_('The text of the article must be at least {min} characters long').format(min=3))])
    
    
    image = FileField(_('Image file'), validators=[Optional(strip_whitespace=True),
                                                           FileAllowed([ 'jpg', 'jpeg', 'png' ],
                                                            _('Only jpg, jpeg and png image files are allowed!')),
                                                           maxImageSize(max_size=2)])


    release_year = IntegerField(label=_('Year of first projection of the crop'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       NumberRange(min=1888, max=current_year, message=_('This field takes values from 1888 to the current year'))])


    rating = IntegerField(label=_('Crop Rating'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       NumberRange(min=1, max=100, message=_('This field takes values from {min} to {max}').format(min=3,max=15))])


    submit = SubmitField(label=_('Submit'))