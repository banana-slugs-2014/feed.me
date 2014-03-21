class RestaurantsController < ApplicationController

  def index
  end

  def create
    p params
    redirect_to '/'
  end
end