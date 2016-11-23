import unittest
import server
from model import connect_to_db, db, User, Language, Userlang, example_data
from server import app
import server
import json

class IntegrationTests(unittest.TestCase):

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

        result = self.client.get('/', follow_redirects=True)
        self.assertEqual(result.status_code, 200)
        self.assertIn('Babilim', result.data)

    def test_login(self):
        """For login form"""

        result = self.client.post('/', data={'email': "uzma@uzma.com", 'password': "uzma"},
                                    follow_redirects=True)
        self.assertIn('Welcome', result.data)

    def test_signup(self):
        """For signup form"""

        result = self.client.post('/signup', data={'full_name': 'Yusra',
                                    'username': 'yusra', 'email': 'yusra@yusra.com',
                                    'password': 'yusra', 'age': '29', 'city': 'San Francisco',
                                    'zipcode': '94123', 'user_bio': 'blah'}, follow_redirects=True)
        self.assertIn('Welcome', result.data)

    def test_user_page(self):
        """Test user page."""

        result = self.client.get("/user/1")
        self.assertIn("Yusra", result.data)


    def test_logout(self):
        """Test logout functionality"""

        result = self.client.get("/logout", follow_redirects=True)

        self.assertNotIn("Random", result.data)
        self.assertIn("Login", result.data)


if __name__ == "__main__":
    unittest.main(verbosity=2)
