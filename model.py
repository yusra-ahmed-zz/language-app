from flask_sqlalchemy import SQLAlchemy


db = SQLAlchemy()

class ToDictMixin(object):
    """Provides a method to return a dictionary version of a model class."""

    def to_dict(self):
        """Returns a dictionary representing the object"""

        dict_of_obj = {}

        #iterate through the table's columns, adding the value in each
        #to the dictionary
        for column_name in self.__mapper__.column_attrs.keys():
            value = getattr(self, column_name, None)
            dict_of_obj[column_name] = value

        #return the completed dictionary
        return dict_of_obj



##############################################################################
# Model definitions

class User(db.Model, ToDictMixin):
    """User of language-buddy app"""

    __tablename__ = "users"

    user_id = db.Column(db.Integer, autoincrement=True, primary_key=True)
    full_name = db.Column(db.String(50), nullable=False)
    username = db.Column(db.String(30), nullable=False, unique=True)
    email = db.Column(db.String(50), nullable=False, unique=True)
    password = db.Column(db.String(30), nullable=False)
    age = db.Column(db.Integer, nullable=True)
    city = db.Column(db.String(30), nullable=False)
    zipcode = db.Column(db.String(15), nullable=False)
    user_bio = db.Column(db.String(500), nullable=True)
    profile_photo = db.Column(db.String(300), nullable=True)


    fluent_join = "and_(User.user_id==Userlang.user_id, Userlang.fluent==True)"
    practice_join = "and_(User.user_id==Userlang.user_id, Userlang.fluent==False)"

    fluent_userlangs = db.relationship("Userlang", primaryjoin=fluent_join)
    practice_userlangs = db.relationship("Userlang", primaryjoin=practice_join)

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

    user = db.relationship("User")
    #removed backref

    language = db.relationship("Language", backref=db.backref("userlangs", order_by=userlang_id))

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<Userlang userlang_id=%s user_id=%s lang_id=%s fluent=%s>" % (self.userlang_id, self.user_id, self.lang_id, self.fluent)



##############################################################################
# Helper functions
# def example_data():
#     """create some sample data"""

#     ex_user = User(user_id=1, full_name="Yusra", username="yusra", email="yusra@yusra.com",
#             password="yusra", age=29, city="San Francisco", zipcode="94123", user_bio="blah")
#     ex_lang = Language(lang_id=1, lang_name="Arabic")

#     ex_userlang = Userlang(userlang_id=1, user_id=1, lang_id=1, fluent=False)

def connect_to_db(app, db_URI='postgresql:///userlangs'):
    """Connect the database to our Flask app."""

    # Configure to use our PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = db_URI
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    db.app = app
    db.init_app(app)


if __name__ == "__main__":
    # As a convenience, if we run this module interactively, it will leave
    # you in a state of being able to work with the database directly.

    from server import app
    connect_to_db(app)
    print "Connected to DB."
