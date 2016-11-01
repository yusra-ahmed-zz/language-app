from flask_sqlalchemy import SQLAlchemy




db = SQLAlchemy()

##############################################################################
# Model definitions

class User(db.Model):
    """User of language-buddy app"""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    first_name = db.Column(db.String(30), nullable=False)
    last_name = db.Column(db.String(30), nullable=False)
    email = db.Column(db.String(64), nullable=False)
    password = db.Column(db.String(64), nullable=False)
    age = db.Column(db.Integer, nullable=True)
    zipcode = db.Column(db.String(15), nullable=True)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<User user_id=%s first_name=%s last_name=%s email=%s>" % (self.user_id,
            self.first_name, self.last_name, self.email)


class Language(db.Model):
    """Languages of language-buddy app"""

    __tablename__ = "languages"

    lang_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    lang_name = db.Column(db.String(15), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Language lang_id=%s lang_name=%s>" % (self.lang_id, self.lang_name)


class Userlang(db.Model):
    """Languages of each user"""

    __tablename__ = "userlangs"

    userlang_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
    lang_id = db.Column(db.Integer, db.ForeignKey('languages.lang_id'))
    fluent = db.Column(db.String(15))










##############################################################################
# Helper functions

def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///____________'
    #
    #ADD DATABASE NAME HERE ^
    #
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
