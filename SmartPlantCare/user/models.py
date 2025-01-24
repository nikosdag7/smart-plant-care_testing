from .. import db
from sqlalchemy import PrimaryKeyConstraint, ForeignKeyConstraint, UniqueConstraint
from werkzeug.security import generate_password_hash, check_password_hash
from .. import login_manager
from flask_login import UserMixin

class Language(db.Model):
    __tablename__ = 'language'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='language_pk'),
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(50), nullable=False)
    code = db.Column(db.String(2), nullable=False)

    def __repr__(self):
        return f"{self.id}:{self.name}"


class User(db.Model, UserMixin):
    __tablename__ = 'user'
    __table_args__ = (
        PrimaryKeyConstraint('id', name='user_pk'),
    )
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(15), unique=True, nullable=False)
    email = db.Column(db.String(150), unique=True, nullable=False)
    profile_image = db.Column(db.String(30), nullable=False, default='default_profile_image.png')
    password = db.Column(db.String(128), nullable=False)
    crops = db.relationship('Crop', backref='owner', lazy=True)

    def __repr__(self):
        return f"{self.username}:{self.email}"
    
@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))