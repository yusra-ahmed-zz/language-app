
from jinja2 import StrictUndefined

from flask import Flask, render_template, request, flash, redirect, session
from flask_debugtoolbar import DebugToolbarExtension
from flask_mail import Mail, Message

from model import connect_to_db, db, User, Language, Userlang

app = Flask(__name__)
mail = Mail(app)

app.config['MAIL_SERVER']='smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'babilimapp@gmail.com'
app.config['MAIL_PASSWORD'] = 'Babilimapp16'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
mail = Mail(app)

app.secret_key = "Myapp1234"

app.jinja_env.undefined = StrictUndefined
app.jinja_env.auto_reload = True

@app.route('/')
def index():
    """Homepage."""

    return render_template("homepage.html")


@app.route('/signup', methods=['GET'])
def register_form():
    """Show new user registration form."""

    languages = Language.query.all()


    return render_template("signup_form.html", languages=languages)


@app.route('/signup', methods=['POST'])
def register_process():
    """Process signup form"""
    # import pdb; pdb.set_trace()
    # Get form variables
    full_name = request.form.get("full_name")
    username = request.form.get("username")
    email = request.form.get("email")
    password = request.form.get("password")
    age = int(request.form.get("age"))
    city = request.form.get("city")
    zipcode = request.form.get("zipcode")
    user_bio = request.form.get("user_bio")

    user = User.query.filter_by(email=email).first()
    
    if user:
        flash("This email is already registered. Please login with your email and password.")
        return redirect("/login")
    else:
        user = User(full_name=full_name, email=email, username=username,
                password=password, age=age, city=city, zipcode=zipcode, user_bio=user_bio)
        db.session.add(user)
        db.session.commit()
        session['user_id'] = user.user_id
        flash("Registration Successful. Welcome to Babilim")
        return render_template("dashboard.html", user=user)
        #change this later to the appropriate redirect


@app.route('/login', methods=['GET'])
def login_form():
    """Show login form for existing users."""

    return render_template("login_form.html")



@app.route('/login', methods=['POST'])
def login_process():
    """Process login"""


    email = request.form.get("email")
    password = request.form.get("password")

    user = User.query.filter_by(email=email).first()

    if not user:
        flash("Incorrect email or password")
        return redirect("/login")

    if user.password != password:
        flash("Incorrect email or password")
        return redirect("/login")

    session["user_id"] = user.user_id

    flash("Login Successful!")

    return render_template("dashboard.html")


@app.route('/logout')
def logout():
    """Log out."""

    del session["user_id"]
    flash("Logged Out.")
    return redirect("/")


@app.route('/<int:user_id>')
def show_user_page(user_id):
    """Show individual user's profile page"""
    browsed = request.args.get('browsed')
    browsed_user = User.query.get(int(browsed))

    user = User.query.get(user_id)
    user_id = session.get("user_id")

    msg = Message('Hello', sender = user.email, recipients = [browsed_user.email])
    msg.body = "Hello Flask message sent from Flask-Mail"
    mail.send(msg)
    # return "Sent"
    return render_template("user_profile.html")


if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the point
    # that we invoke the DebugToolbarExtension

    # Do not debug for demo
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run(debug=True, host='0.0.0.0', port=5001)
