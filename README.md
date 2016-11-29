# Babilim
#### This Flask app serves as a medium for language learners to make new friends in their city with whom they can meet up and practice their skills. 

![alt text](https://raw.githubusercontent.com/yusra-ahmed/language-app/master/static/readme/landing-page.png "Landing Page")
Through a SQL Alchemy query, users are symbiotically matched based on the language they're learning, their fluent language, and their city, wherein, a match only occurs with people who fluently speak the language they're learning and those people are also learning the language in which the user is fluent. Upon creating an account, users automatically receive a welcome email, a feature that was implemented using the Mandrill API. Additionally, their passwords are protected via bcrypt hashing. Users are able to interact with each other by email or private chat rooms that were created with Flask Socket.io. 

## Technical Stack
* Python
* Javascript
* SQLAlchemy
* Jinja2
* HTML
* jQuery
* JSON
* Ajax
* Flask
* Postgres
* Bootstrap
* CSS
* Unittest
* Bcrypt
* Flask Socket.io


## API Used
* Mandrill API

## Feature List
#### Sign-Up
![alt text](https://raw.githubusercontent.com/yusra-ahmed/language-app/master/static/readme/sign-up-page.png "Sign-up Page")
All users need to create an account to use the app. Upon signing up, they get added to a postgres database and receive a welcome email via the Mandrill API. 

#### Dashboard
![alt text](https://raw.githubusercontent.com/yusra-ahmed/language-app/master/static/readme/dashboard.png "Dashboard")

Once logged in, users have access to their personal dashboard where they can filter for new friends, update/view their profile, or search for other users.

#### Search Feature
![alt text](https://raw.githubusercontent.com/yusra-ahmed/language-app/master/static/readme/search-feature.png "Search Users")

The search feature uses a key-up event listener to access the postgres database so users can look for people they may already know in order to directly access their profile.

#### Filter Users
![alt text](https://raw.githubusercontent.com/yusra-ahmed/language-app/master/static/readme/filter-feature.png "Filter Users")

Using SQLAlchemy to query the postgres database, users can find new friends through filtering which will populate the results through an Ajax request. The user's matches are people who not only fluently speak the language the user is learning, but are also learning the language in which the user is fluent so it's a symbiotic relationship.

#### Connect with User
![alt text](https://raw.githubusercontent.com/yusra-ahmed/language-app/master/static/readme/user-page.png "User Page")

On the personal profile pages, users are able to learn more about their matches and contact them via email or invite them to chat if they're online.

#### Chat Invitation
![alt text](https://raw.githubusercontent.com/yusra-ahmed/language-app/master/static/readme/chat-invite.png "Chat Invite")
On the receiving end, the user gets a notification inviting them to chat. Once they click ok, they're taken into a private chat room. 

#### Chat Room
![alt text](https://raw.githubusercontent.com/yusra-ahmed/language-app/master/static/readme/chat-socket.png "Chat Socket")

The chat feature uses a websocket created via Flask Socket.io that opens up a line of connection between the client and the server and continously remains open until the users leave the conversation.


## Favorite Challenges
* Flask Socket.io
* Creating user cross-matches using SQLAlchemy and Postgres
* Integration testing the app

## About the Developer
Yusra Ahmed is a software engineer living in San Francisco.
Learn more about the developer: https://www.linkedin.com/in/yusraa