[![Build Status](https://travis-ci.org/banana-slugs-2014/feed.me.png?branch=master)](https://travis-ci.org/banana-slugs-2014/feed.me)
#[Feed.Me](http://www.feedthebeast.today) Documentation

## A path to the simpler choices in life.
#### Let us make the dinner choice for you

DBC Banana Slugs 2014. [Johnny Wu](johnnywu.io), [Phil Vargas](https://github.com/PhilVargas), [Mathilde Mouw](https://github.com/mathildemouw), [Darren Dahl](https://github.com/darrendahl), and [Harry Whelchel](https://github.com/harryw377).

![feedthebeast](http://i.imgur.com/nyEZV13.png)

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


#[Link to Trello!](https://trello.com/b/YaWsIABY/help-me)

![](http://emilymeixin.files.wordpress.com/2013/09/ios7_icon_redesign_by_ida_swarczewskaja.png)


