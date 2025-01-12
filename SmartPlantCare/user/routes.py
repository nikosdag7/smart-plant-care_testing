from pickle import FALSE
from tokenize import String
from flask import render_template, flash, redirect, url_for, request, session, abort
from flask_login import login_user, logout_user, login_required, \
    current_user
from flask_babel import _
from . import user

#from .forms import SignupForm, AccountUpdateForm

#from .formss import loginForm
#from SmartPlantCare.user.formss.loginForm import loginForm
from .forms.signupForm import signupForm
from .forms.loginForm import loginForm
from .forms.accountUpdateForm import accountUpdateForm
from .models import Language, User
from .. import db, bcrypt
#from werkzeug.urls import url_parse

import secrets
from PIL import Image
import os
from datetime import datetime as dt

from SmartPlantCare import app

current_year = dt.now().year

### get user language ###
def get_locale():
    return session.get('lang', request.accept_languages.best_match(
            app.config['LANGUAGES']) or app.config['LANGUAGES'][0])

### Rename and save image file ###
def image_save(image, where, size):
    random_filename = secrets.token_hex(8)
    file_name, file_extension = os.path.splitext(image.filename)
    image_filename = random_filename + file_extension
    image_path = os.path.join(app.root_path, 'static/images/'+ where, image_filename)
    image_size = size # this must be a tupe in the form of: (150, 150)
    img = Image.open(image)
    img.thumbnail(image_size)
    img.save(image_path)
    return image_filename

@user.route("/signup/", methods=['GET','POST'])
def signup():

    if current_user.is_authenticated:
        return redirect(url_for("crop.crops"))

    ### Create an instance of the Sign Up form ###
    form = signupForm()

    if request.method == 'POST' and form.validate_on_submit():

        username = form.username.data
        email = form.email.data
        password = form.password.data
        password2 = form.password2.data

        encrypted_password = bcrypt.generate_password_hash(password).decode('UTF-8')

        user = User(username=username, email=email, password=encrypted_password)
        db.session.add(user)
        db.session.commit()

        flash(_('The account for user <b>{username}</b> was created successfully.').format(username=username), 'success')
        return redirect(url_for('user.login_page'))

    return render_template("signup.html", form=form)


@user.route("/account/", methods=['GET','POST'])
@login_required
def account():

    form = accountUpdateForm(username=current_user.username, email=current_user.email)

    if request.method == 'POST' and form.validate_on_submit():

        current_user.username = form.username.data
        current_user.email = form.email.data

        if form.profile_image.data:

            try:
                image_file = image_save(form.profile_image.data, 'profiles_images', (150, 150))
            except:
                abort(415)

            current_user.profile_image = image_file

        db.session.commit()

        flash(_('The account of the user <b>{username}</b> was updated successfully.').format(username=current_user.username), 'success')

        return redirect(url_for('crop.crops'))
    else:
        return render_template("account_update.html", form=form)


###  Login Page ###
@user.route("/login/", methods=['GET','POST'])
def login_page():

    if current_user.is_authenticated:
        return redirect(url_for("crop.crops"))

    form = loginForm()

    if request.method == 'POST' and form.validate_on_submit():
        email = form.email.data
        password = form.password.data

        user = User.query.filter_by(email=email).first()

        if user and bcrypt.check_password_hash(user.password, password):
            lang_code = get_locale()
            db_language = Language.query.filter_by(code=lang_code).one_or_404()
            session['lang_id'] = db_language.id
            session['lang'] = db_language.code
            flash(_('The login of the user with email: {email} to our website was successful.').format(email=email), 'success')
            login_user(user, remember=form.remember_me.data)

            next_link = request.args.get("next")

            return redirect(next_link) if next_link else redirect(url_for("crop.crops"))
        else:
            flash(_('User login was unsuccessful, please try again with the correct email/password.'), 'warning')

    return render_template("login.html", form=form)

### Logout Page ###
@user.route("/logout/")
def logout_page():
    
    session.clear()
    logout_user()

    flash(_('The user has been logged out.'), 'success')

    return redirect(url_for("root"))

@user.route('/set_language/<language>')
def set_language(language):

    db_language = Language.query.filter_by(code=language).first()
    if db_language:
        session['lang_id'] = db_language.id
        session['lang'] = db_language.code
        response = redirect(request.referrer)
        
        return response
    else:
        return render_template('404.html'), 404