require 'json'
require 'open-uri'


class PlacesController < ApplicationController

  def index
  end

  def create

  #  url = "https://maps.googleapis.com/maps/api/place/details/json?location=51.50401607915134,-0.10931970886235831&radius=500&types=food&sensor=false&key=#{ENV['GOOGLE_KEY']}"
  # result = open(url) do |file|
  #   JSON.parse(file.read)
  # end
  binding.pry
  # p result
  p "*" * 40



    redirect_to '/'
  end
end