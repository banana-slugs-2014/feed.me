require 'json'
require 'open-uri'


class PlacesController < ApplicationController
  before_filter :update_user_position, only: :create

  def index

  end

  def show
    args = {}
    args[:user] = current_user
    args[:strategy] = SimpleGooglePlaces.create
    @recommendation = Recommender.new(args).recommend
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
