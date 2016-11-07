from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

##############################################################################
# Model definitions

class User(db.Model):
    """User of language-buddy app"""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    full_name = db.Column(db.String(50), nullable=False)
    username = db.Column(db.String(30), nullable=False)
    email = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(30), nullable=False)
    age = db.Column(db.Integer, nullable=True)
    city = db.Column(db.String(30), nullable=False)
    zipcode = db.Column(db.String(15), nullable=False)
    user_bio = db.Column(db.String(300), nullable=True)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<User user_id=%s full_name=%s username=%s>" % (self.user_id, self.full_name, self.username)


class Language(db.Model):
    """Languages of language-buddy app"""

    __tablename__ = "languages"

    lang_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    lang_name = db.Column(db.String(50), nullable=False)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Language lang_id=%s lang_name=%s>" % (self.lang_id, self.lang_name)


class Userlang(db.Model):
    """Languages of each user"""

    __tablename__ = "userlangs"

    userlang_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('users.user_id'))
    lang_id = db.Column(db.Integer, db.ForeignKey('languages.lang_id'))
    fluent = db.Column(db.Boolean)

    user = db.relationship("User",
                            backref=db.backref("userlangs", order_by=userlang_id))

    language = db.relationship("Language",
                                backref=db.backref("userlangs", order_by=userlang_id))


    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Userlang userlang_id=%s user_id=%s lang_id=%s fluent=%s>" % (self.userlang_id,
                self.user_id, self.lang_id, self.fluent)

        #ask about boolean value in the repr









##############################################################################
# Helper functions

def connect_to_db(app):
    """Connect the database to our Flask app."""

    # Configure to use our PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///userlangs'
 
    
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
