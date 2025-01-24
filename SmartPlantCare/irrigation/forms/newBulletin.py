from flask_wtf import FlaskForm
from flask_wtf.file import FileField, FileAllowed
from flask_babel import _
from wtforms import DateField, StringField, SubmitField, BooleanField, TextAreaField, IntegerField, FloatField
#from wtforms.validators import DataRequired, Email, Length, EqualTo, ValidationError, Optional, NumberRange
from wtforms.validators import DataRequired, Length, EqualTo, ValidationError, Optional, NumberRange
#from SmartPlantCare.models import User
#from flask_login import current_user

class newBulletin(FlaskForm):

    # start_date - DateField, DataRequired
    start_date = DateField(label=_('Bulletin Start Date'),
                           validators=[DataRequired(message=_('This field cannot be empty.'))])

    # end_date - DateField, DataRequired
    end_date = DateField(label=_('Bulletin End Date'),
                           validators=[DataRequired(message=_('This field cannot be empty.'))])

    # file, DataRequired, FileAllowed(csv)
    file = FileField(_('CSV file'), validators=[
        DataRequired(message=_('This field cannot be empty.'))
        , Optional(strip_whitespace=True)
        , FileAllowed([ 'csv' ], _('Only CSV files are allowed!'))
        ])

    submit = SubmitField(label=_('Submit'))