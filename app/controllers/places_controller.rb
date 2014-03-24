require 'json'
require 'open-uri'
require 'oauth'


class PlacesController < ApplicationController

  def index
  end

  def show
  end

  def create
    #  Definitely catching the code smell of LONG METHOD here....
    #  Let's find some good refactorings

    @user_location = JSON.parse(params[:userLocation]) # belongs in controller

    # Nope.  Ask an object that knows how to calculate that
    #
    # FoursquareProximalLocationsCalculator.new(...).locations
    #
    # How dope is METHOD OBJECT.  That plus the strategy pattern will make you
    # look pro-grade.

    places = get_places_from_foursquare(@user_location["latitude"], @user_location["longitude"])
    
    # Why does a controller have this responsibility?  Is it redirecting,
    # gathering data, or rendering?  Nope.  Does not belong here.

    @places = places.map do |place|
      #find categories
      categories = get_foursquare_categories_names(place["categories"])
      #find_menu if exists
      menu_url = find_foursquare_menu_url(place)

      Place.new(name: place["name"],
        phone_num: place["contact"]["phone"],
        address: place["location"]["address"],
        postal_code: place["location"]["postalCode"],
        latitude: place["location"]["lat"],
        longitude: place["location"]["lng"],
        types: categories,
        menu_url: menu_url, company_url: place["url"])
    end
    render partial: 'show', locals: {places: @places}
  end


  def get_places_from_foursquare(lat, long)
    # NO NO NO.  This is a "magic string".  Could be a constant or something?  Why these paths?  Why here?  Why is
    # this in a controller even?

     response = HTTParty.get("https://api.foursquare.com/v2/venues/search?client_id=#{ENV['FOURSQUARE_ID']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20130815&ll=#{lat},#{long}&categoryId=4d4b7105d754a06374d81259")

     response["response"]["venues"]
  end

  # As is, this action is exposable via the routes.rb file.  This should be in
  # under a `private` block or in a class...

  def get_foursquare_categories_names(cat_array)
     return cat_array.map do |thing|
        thing["name"]
      end
  end

  # Should not be here.

  def find_foursquare_menu_url(place)
    if place["menu"]
      return menu_url = place["menu"]["url"]
    else
      return "no menu url"
    end
    @recommendation = Recommender.new(current_user).recommend
  end

  # Should not be here.
  def get_places_from_yelp(lat, long)
    api_host = 'api.yelp.com'
    consumer = OAuth::Consumer.new(ENV['YELP_KEY'], ENV['YELP_SECRET'], {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, ENV['YELP_TOKEN'], ENV['YELP_TOKEN_SECRET'])

    path = "/v2/search?term=food&ll=#{lat},#{long}"
    info = access_token.get(path).body
  end

end
