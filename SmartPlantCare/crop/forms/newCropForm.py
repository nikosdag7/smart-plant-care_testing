from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from flask_babel import _
from wtforms import StringField, SubmitField, BooleanField, TextAreaField, IntegerField, FloatField
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

    # name - StringField, DataRequired, Length(3-50)
    name = StringField(label=_('Crop Name'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       Length(min=3, max=50, message=_('This field must be between {min} and {max} characters').format(min=3,max=50))])

    # location - StringField, Length(3-50)
    location = StringField(label=_('Crop Location'),
                           validators=[Length(min=3, max=50, message=_('This field must be between {min} and {max} characters').format(min=3,max=50))])

    # prefecture - StringField, Length(3-50)
    prefecture = StringField(label=_('Crop Prefecture'),
                           validators=[Length(min=3, max=50, message=_('This field must be between {min} and {max} characters').format(min=3,max=50))])

    # area - IntegerField, DataRequired, NumberRange (1-99)
    area = IntegerField(label=_('The area of the crop'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       NumberRange(min=1, max=99, message=_('This field takes values from 1 to 99'))])
 
    # crop_area - FloatField, DataRequired, NumberRange (1-99)
    crop_area = FloatField(label=_('The size of the crop'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       NumberRange(min=1, max=1000, message=_('This field takes values from 1 to 1000'))])

    # crop_type - IntegerField, DataRequired, NumberRange (1-9)
    crop_type = IntegerField(label=_('The type of the crop'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       NumberRange(min=1, max=9, message=_('This field takes values from 1 to 9'))])

    # soil_type - IntegerField, DataRequired, NumberRange (1-9)
    soil_type = IntegerField(label=_('The soil type of the crop'),
                           validators=[DataRequired(message=_('This field cannot be empty.')),
                                       NumberRange(min=1, max=9, message=_('This field takes values from 1 to 9'))])

    # crop_map - StringField, Length(5-5000)
    crop_map = TextAreaField(label=_('Crop map'),
                           validators=[Length(min=0, max=5000, message=_('This field must be between {min} and {max} characters').format(min=0,max=5000))])
      

    # image, FileAllowed(jpg, jpeg, png)
    image = FileField(_('Image file'), validators=[Optional(strip_whitespace=True),
                                                           FileAllowed([ 'jpg', 'jpeg', 'png' ],
                                                            _('Only jpg, jpeg and png image files are allowed!')),
                                                           maxImageSize(max_size=2)])

    submit = SubmitField(label=_('Submit'))