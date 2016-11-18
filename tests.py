import unittest
import server
from model import connect_to_db, db, User, Language, Userlang
from server import app

class FlaskTests(unittest.TestCase):

    # TEST_DATABASE_URI = 'postgresql:////otheruserlangs'
    

    def setUp(self):
        """Set up a fake browser"""
        # Get the Flask test client
        self.client = app.test_client()
        with self.client as c:
            with c.session_transaction() as sess:
                sess['user_id'] = 1
                sess['username'] = 'yusra'

        app.config['TESTING'] = True
        app.config['DEBUG'] = False
        connect_to_db(app, "postgresql:///testdb")

        app.secret_key = "Babilim1234"

        # Connects to fake database
        db.create_all()
        example_data()

    def tearDown(self):
        """Close DB session and drop all tables"""
        db.session.close()
        db.drop_all()

    def test_homepage(self):
        """For homepage rendering"""

        result = self.client.get('/')
        self.assertEqual(result.status_code, 200)
        self.assertIn('Babilim', result.data)
        #passed

    def test_login(self):
        """For login form"""

        result = self.client.post('/', data={'email': "uzma@uzma.com", 'password': "uzma"},
                                    follow_redirects=True)
        self.assertIn('Welcome', result.data)


    def test_logout(self):
        """Test logout functionality"""



        result = self.client.get("/logout", follow_redirects=True)


        self.assertNotIn("Random", result.data)
        self.assertIn("Login", result.data)


if __name__ == "__main__":
    unittest.main(verbosity=2)
