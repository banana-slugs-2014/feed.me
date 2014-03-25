require 'json'
require 'open-uri'
require 'oauth'


class PlacesController < ApplicationController
  include StrategyTester

  def index
  end

  def show
  end

  def create
    user_location = JSON.parse(params[:userLocation])
    places = get_places_from_foursquare(user_location["latitude"],user_location["longitude"])
      #initialize new places in the database

    places = places.map do |place|
      #find categories
      categories = get_foursquare_categories_names(place["categories"])
      #find_menu if exists
      menu_url = find_foursquare_menu_url(place)
      new_place = Place.create(name: place["name"],
          phone_num: place["contact"]["phone"],
          address: place["location"]["address"],
          postal_code: place["location"]["postalCode"],
          latitude: place["location"]["lat"],
          longitude: place["location"]["lng"],
          types: categories,
          menu_url: menu_url, company_url: place["url"])
      new_place.valid? ? new_place : Place.find_by_name(place["name"])
    end

    trial = ab_test('Recommendation Strategy', *StrategyTester.strategies).constantize
    recommendation = Recommender.new(current_user, places, {strategy: trial}).recommend
    render partial: 'show', locals: { recommendation: recommendation }
  end

  private

  def get_places_from_foursquare(lat, long)
     response = HTTParty.get("https://api.foursquare.com/v2/venues/search?client_id=#{ENV['FOURSQUARE_ID']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20130815&ll=#{lat},#{long}&categoryId=4d4b7105d754a06374d81259")

     response["response"]["venues"]
  end

  def get_foursquare_categories_names(cat_array)
     return cat_array.map do |thing|
        thing["name"]
      end
  end

  def find_foursquare_menu_url(place)
    if place["menu"]
      return menu_url = place["menu"]["url"]
    else
      return "no menu url"
    end
  end

  def get_places_from_yelp(lat, long)
    api_host = 'api.yelp.com'
    consumer = OAuth::Consumer.new(ENV['YELP_KEY'], ENV['YELP_SECRET'], {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, ENV['YELP_TOKEN'], ENV['YELP_TOKEN_SECRET'])

    path = "/v2/search?term=food&ll=#{lat},#{long}"
    info = access_token.get(path).body
  end

end
