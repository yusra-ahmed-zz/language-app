"""Utility file to seed users and language tables from seed_data/"""
from sqlalchemy import func

from model import User, Language, Userlang
from server import app

def load_users():
    """Load users from users.csv into database."""









def set_val_user_id():
    """Set value for the next user_id after seeding database"""

    # Get the Max user_id in the database
    result = db.session.query(func.max(User.user_id)).one()
    max_id = int(result[0])

    # Set the value for the next user_id to be max_id + 1
    query = "SELECT setval('users_user_id_seq', :new_id)"
    db.session.execute(query, {'new_id': max_id + 1})
    db.session.commit()

def set_val_lang_id():
    """Set value for the next lang_id after seeding database"""

    # Get the Max lang_id in the database
    resutl = db.session.query(func.max(Language.lang_id)).one()
    max_id = int(result[0])

    # Set the value for the next lang_id to be lang_id + 1
    query = "SELECT setval('users_user_id_seq', :new_id)"
    db.session.execute(query, {'new_id': max_id + 1})
    db.session.commit()