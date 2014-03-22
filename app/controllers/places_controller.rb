require 'json'
require 'open-uri'


class PlacesController < ApplicationController

  def index
  end

  def create
    p params
    @places = JSON.parse(params[:places]).map do |place|
      Place.new(name: place["name"], address: place["address"], types: place["types"], latitude: place["latitude"], longitude: place["longitude"])
    end
    binding.pry
    redirect_to '/'
  end
end