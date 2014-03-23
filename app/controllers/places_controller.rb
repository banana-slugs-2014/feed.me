require 'json'
require 'open-uri'


class PlacesController < ApplicationController

  def index

  end

  def show
    @recommendation = Recommender.new(current_user).recommend
    # render partial: "places/show", locals: { places: @recommendation }
  end

  def create
    places = JSON.parse(params[:places]).map do |place|
      Place.create(name: place["name"], address: place["address"], types: place["types"], latitude: place["latitude"], longitude: place["longitude"])
    end

    # redirect_to :show
    render partial: "places/show", locals: { places: places }
  end
end
