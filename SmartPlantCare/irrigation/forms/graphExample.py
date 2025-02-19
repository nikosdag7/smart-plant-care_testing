from flask_wtf import FlaskForm
from flask_babel import _
from wtforms import DateField, SubmitField
from wtforms.validators import DataRequired

class graphExample(FlaskForm):

    # start_date - DateField, DataRequired
    start_date = DateField(label=_('Readings Graph Start Date'),
                           validators=[DataRequired(message=_('This field cannot be empty.'))])

    # end_date - DateField, DataRequired
    end_date = DateField(label=_('Readings Graph End Date'),
                           validators=[DataRequired(message=_('This field cannot be empty.'))])

    submit = SubmitField(label=_('Submit'))