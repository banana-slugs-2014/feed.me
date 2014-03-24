class RecommendationsController < ApplicationController

  # I think we should use new, create, and edit actions here
  # for the core user experience instead of places actions.

  def update
    RecommendableWorker.perform_async(current_user, Place.find(params[:id]))
  end


end