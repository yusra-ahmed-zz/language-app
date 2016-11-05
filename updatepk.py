"""Utility file to seed users and language tables from seed_data/"""
from sqlalchemy import func

from model import connect_to_db, db, User, Language, Userlang
from server import app


def set_val_user_id():
    """Set value for the next user_id after seeding database"""

    # Get the Max user_id in the database
    result = db.session.query(func.max(User.user_id)).one()
    max_id = int(result[0])

    # Set the value for the next user_id to be max_id + 1
    query = "SELECT setval('users_user_id_seq', :new_id)"
    db.session.execute(query, {'new_id': max_id})
    db.session.commit()

def set_val_lang_id():
    """Set value for the next lang_id after seeding database"""

    # Get the Max lang_id in the database
    result = db.session.query(func.max(Language.lang_id)).one()
    max_id = int(result[0])

    # Set the value for the next lang_id to be lang_id + 1
    query = "SELECT setval('languages_lang_id_seq', :new_id)"
    db.session.execute(query, {'new_id': max_id})
    db.session.commit()


if __name__ == "__main__":
    # We have to set debug=True here, since it has to be True at the point
    # that we invoke the DebugToolbarExtension

    connect_to_db(app)
    set_val_user_id()
    set_val_lang_id()
    print "connect_to_db"
