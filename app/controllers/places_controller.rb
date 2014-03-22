require 'json'
require 'open-uri'
require 'oauth'


class PlacesController < ApplicationController

  def index
  end

  def create


    @places = JSON.parse(params[:places]).map do |place|
      Place.new(name: place["name"], address: place["address"], types: place["types"], latitude: place["latitude"], longitude: place["longitude"])
    end

    @places = get_more_info_from_yelp(@places)

    redirect_to '/'
  end


  def get_more_info_from_yelp(places)
    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(ENV['YELP_KEY'], ENV['YELP_SECRET'], {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, ENV['YELP_TOKEN'], ENV['YELP_TOKEN_SECRET'])
    # @places = places.map do |place|
    #   #replace spaces with hyphens for URL
    #   name = place.name.gsub(/ /, '-')
    #   #removes all symbols except for hyphens
    #   name = name.gsub(/[^0-9A-Za-z-]/, '')
    #   #handle multiple hyphen cases
    #   name = name.gsub(/[-]+/, '-')
    #   p name
    #   # path = "/v2/business/" + name
    #   # info = access_token.get(path).body
    #   # p JSON.parse(info)
    # end
    path = "/v2/business/bum-mee-san-francisco"
    info = access_token.get(path).body
    p JSON.parse(info)

  end

end