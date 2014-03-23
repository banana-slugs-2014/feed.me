require 'json'
require 'open-uri'
require 'oauth'


class PlacesController < ApplicationController

  def index
  end

  def create

    @user_location = JSON.parse(params[:userLocation])
    p @user_location

    places = get_places_from_foursquare(@user_location["latitude"], @user_location["longitude"])

    redirect_to '/'
  end


  def get_places_from_foursquare(lat, long)

    places = HTTParty.get("https://api.foursquare.com/v2/venues/search?client_id=#{ENV['FOURSQUARE_ID']}&client_secret=#{ENV['FOURSQUARE_SECRET']}&v=20130815&ll=#{lat},#{long}&categoryId=4d4b7105d754a06374d81259")
  end



  def get_places_from_yelp(lat, long)
    api_host = 'api.yelp.com'
    consumer = OAuth::Consumer.new(ENV['YELP_KEY'], ENV['YELP_SECRET'], {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, ENV['YELP_TOKEN'], ENV['YELP_TOKEN_SECRET'])

    path = "/v2/search?term=food&ll=#{lat},#{long}"
    info = access_token.get(path).body
    pp JSON.parse(info)
  end

end