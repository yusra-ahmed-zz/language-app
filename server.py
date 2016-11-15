
from jinja2 import StrictUndefined

from flask import Flask, render_template, request, flash, redirect, session, jsonify
from flask_debugtoolbar import DebugToolbarExtension
# from flask_mail import Mail, Message

from model import connect_to_db, db, User, Language, Userlang
import mandrill

# import email

app = Flask(__name__)
mandrill_client = mandrill.Mandrill('kG9ii2FflHnLKqA4oJAKIA')


app.secret_key = "Myapp1234"

app.jinja_env.undefined = StrictUndefined
app.jinja_env.auto_reload = True


@app.route('/')
def index():
    """Homepage with login access"""
# If user is already logged in, redirect them to user dashboard
# If not render the homepage template

    if session.get("user_id"):
        return redirect("/dashboard")

    else:
        languages = Language.query.all()
        return render_template("homepage.html", languages=languages)


@app.route('/', methods=['POST'])
def login_process():
    """Process login"""

    email = request.form.get("email")
    password = request.form.get("password")

    user = User.query.filter_by(email=email).first()

    if not user:
        flash("Incorrect email or password")
        return redirect("/")

    if user.password != password:
        flash("Incorrect email or password")
        return redirect("/")

    session["user_id"] = user.user_id

    flash("Login Successful!")

    return redirect("/dashboard")


@app.route('/logout')
def logout():
    """Log out."""

    del session["user_id"]
    flash("Logged Out.")
    return redirect("/")


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
        return redirect("/")
    else:
        user = User(full_name=full_name, email=email, username=username,
                    password=password, age=age, city=city, zipcode=zipcode,
                    user_bio=user_bio)
        db.session.add(user)
        db.session.commit()

        send_email(user)

        user_id = User.query.filter(User.email == email).one().user_id
        print user_id
        session['user_id'] = user_id

        lang_learn = request.form.get("lang_learn")
        lang_fluent = request.form.get("lang_fluent")
        print "lang_learn", lang_learn
        print "lang_fluent", lang_fluent

        practice = Userlang(user_id=user_id, lang_id=lang_learn,
                            fluent=False)
        fluent = Userlang(user_id=user_id, lang_id=lang_fluent,
                          fluent=True)
        db.session.add(practice)
        db.session.add(fluent)
        db.session.commit()

        flash("Registration Successful. Welcome to Babilim!")
        return redirect("/dashboard")


@app.route('/dashboard')
def user_dashboard():
    """Dashboard for users who are logged in."""

    languages = Language.query.all()
    user_id = session.get("user_id")
    if user_id:
        user = User.query.get(session['user_id'])
        return render_template("dashboard.html", user=user, user_id=user_id, languages=languages)
    else:
        return redirect("/")

@app.route('/get_user.json')
def get_users():


    search = request.args.get("search")

    users = User.query.filter(User.full_name.like('%'+search+'%')).all()

    userinfo = {"users": []}

    for user in users:
        userlist = [user.user_id, user.full_name]
        userinfo["users"].append(userlist)
    print "search feature", userinfo
    return jsonify(userinfo)


@app.route('/find_matches.json')
def find_matches():

    user_id = session["user_id"]
    prac_lang_id = int(request.args.get("lang_learn"))
    desired_city = request.args.get("city")

    my_fluent_userlang_lang_ids = (
        db.session.query(Userlang.lang_id)
                  .filter(Userlang.user_id == user_id,
                          Userlang.fluent.is_(True))
                  .subquery())

    ppl_ids_who_want_my_lang = (
        db.session.query(Userlang.user_id)
                  .filter(Userlang.fluent.is_(False),
                          Userlang.lang_id.in_(my_fluent_userlang_lang_ids))
                  .subquery())

    matches = (
        db.session.query(User)
                  .join(Userlang)
                  .filter(Userlang.user_id.in_(ppl_ids_who_want_my_lang),
                          Userlang.fluent.is_(True),
                          Userlang.lang_id == prac_lang_id,
                          User.city == desired_city)
                  .distinct()
                  .all())

    print "matches", matches
    matches_info = []

    for person in matches:
        match_info = {}
        match_info["name"] = person.full_name
        match_info["city"] = person.city
        match_info["user_id"] = person.user_id
        matches_info.append(match_info)

    print "matchesinfo", matches_info

    return jsonify(matches_info)


@app.route('/users')
def show_all_users():
    """Shows all users on one page"""

    #might need to put this in the dashboard route.
    #access from Nav Bar
    #need access to friends in Nav Bar eventually

    users = User.query.all()
    return render_template("all_users.html", users=users)


@app.route('/user/<int:user_id>')
def show_user_page(user_id):
    """Show individual user's profile page"""

    user = User.query.get(user_id)
    return render_template("user_page.html", user=user)


@app.route('/user_profile_update', methods=['POST'])
def user_profile_update():
    """Handle user profile form to update user's profile"""

    # Get user using user_id in session.
    user = User.query.get(session["user_id"])
    # Get form input for user description, if it is not blank add the new
    # description to the database.

    new_user_bio = request.form.get("user_bio")
    new_name = request.form.get("full_name")
    new_email = request.form.get("email")
    new_username = request.form.get("username")
    new_age = request.form.get("age")
    new_city = request.form.get("city")
    new_zipcode = request.form.get("zipcode")


    if new_user_bio != "":
        user.user_bio = new_user_bio
    if new_name != user.full_name:
        user.full_name = new_name
    if new_email != user.email:
        user.email = new_email
    if new_username != user.username:
        user.username = new_username
    if new_age != user.age:
        user.age = new_age
    if new_city != user.city:
        user.city = new_city
    if new_zipcode != user.zipcode:
        user.zipcode = new_zipcode
    db.session.add(user)
    db.session.commit()

    # new_prac_lang = request.form.get("new_lang_learn")
    # if int(new_prac_lang) != userlang.lang_id:
    #     userlang.lang_id = new_prac_lang

    #     db.session.commit()

    # Flash profile update success and redirect to user homepage.
    flash("Your profile has been updated!")

    return redirect("/dashboard")


def send_email(user):
    """Send email to user"""

    # personal_msg = personal_msg
    # 'html': '<p>' + personal_msg + '</p>',
    message = {'html': '<p> hero </p>',
                'from_email': 'info@babilim.us',
                'from_name': 'Babilim',
                'subject': 'Welcome to Babilim',
                'to': [{'email': user.email}]
    }

    result = mandrill_client.messages.send(message=message)




if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the point
    # that we invoke the DebugToolbarExtension

    # Do not debug for demo
    app.debug = True

    connect_to_db(app)

    # Use the DebugToolbar
    DebugToolbarExtension(app)

    app.run(debug=True, host='0.0.0.0', port=5001, passthrough_errors=False)
