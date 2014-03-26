[![Build Status](https://travis-ci.org/banana-slugs-2014/feed.me.png?branch=master)](https://travis-ci.org/banana-slugs-2014/feed.me)
#Feed.me Documentation

DBC Banana Slugs 2014. Johnny Wu, Phil Vargas, Mathilde Mouw, Darren Dahl, and Harry Whelchel.

***link to site here

#Description

Indecision when you are hungry hurts. Use Feed.me to save yourself from analysis paralysis. Feed.me
learns about you and your preferences through Facebook Oauth and response and collaborative filtering and recommends a restaurant in the local area.

##Major Features

- As a user I can login, click 'Me So Hungry', and see a tailored local restaurant recommendation.
- As a user I can reject the recommendation and see a new recommendation.

###Software Design

- We used Rails/Postgres for our core application backend.
- We used custom CSS and custom MVC Javascript on the frontend.
- We used the strategy design pattern to flexibly test a variety of recommendation algorithms given our
limited data and insight into user preferences. We used the [split gem](https://github.com/andrew/split)
to facilitate the A/B testing of our strategies. In light of our team having a variety of ideas for the recommendation algorithm, the strategy pattern allowed for modular extension of the application facilitating individual team member creativity and ingenuity.

###Strategy Pattern

Feed.me alternately employs six strategies to choose a restaurant recommendation. AwesomeFacebook, FacebookFirstnamePlaces, FacebookWeighted and RecommendableStrategy recommend based on user information. SimpleFourSquare chooses from the most recent search and SimpleQuirkyPlaces chooses from stored data. All inherit from a RecommendationStrategy parent class. Contributors can add (or remove or combine) strategies easily with this modular pattern. A/B testing user responses provides discreet data on which strategies work best.

###User Inteface

Feed.me is mobile-format friendly. Aesthetically simple design allows users to get the critical information for a single restuarant recommendation without information overload or distraction.

###Application Testing



####License

Feed.me is released under the MIT license:

[](http://opensource.org/licenses/MIT)


![asd](http://www.bestgifever.com/data/images/2014/01/idaorhemnpepg.gif)
## A path to the simpler choices in life.
#### Let us make the dinner choice for you

#[Link to Trello!](https://trello.com/b/YaWsIABY/help-me)

![](http://i.imgur.com/Tc0nJRe.png)



![](http://emilymeixin.files.wordpress.com/2013/09/ios7_icon_redesign_by_ida_swarczewskaja.png)


#### Example Databse YML File
test:
  adapter: postgresql
  host: localhost
  database: helpme_test
  pool: 5
  timeout: 5000

##### 1) A user wants to login
#####		- user login, sessions
#####		- user profile, oauth (facebook, google, github, etc)
##### 2) A user is hungry and wants a suggestion for food
##### 	  - search based on user preferences/location/time
##### 3) A user can click a button to get a result "I'm Hungry"
#####		- a user is served 1 result - link to google restaurant
#####		- a user is served 1 result - self rendered info about the restaurant
#####			- name, phone, hours.
