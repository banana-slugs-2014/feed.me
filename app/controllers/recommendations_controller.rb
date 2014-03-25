class RecommendationsController < ApplicationController
  after_filter :update_recommendable_redis, only: :update

  # I think we should use new, create, and edit actions here
  # for the core user experience instead of places actions.

  def update
    if params[:yes]
      like_true!
      recommendation = Recommendation.where(id: params[:id]).first
      render partial: 'recommendations/thankyou', locals: {place: recommendation }
    elsif params[:no]
      like_false!
      places = Place.last(10)
      recommendation = Recommender.new(current_user, places).recommend
      render partial: 'newplace', locals: { recommendation: recommendation}
    end
  end

  # METHODS
  def like_true!
    recommendation = Recommendation.where(id: params[:id]).first
    recommendation.update_attributes(like: true)
    current_user.like recommendation.place
  end
  
  def like_false!
    recommendation = Recommendation.where(id: params[:id]).first
    recommendation.update_attributes(like: false)
    current_user.dislike recommendation.place
  end

  private

  def update_recommendable_redis
    Recommendable::Workers::Sidekiq.perform_async(current_user.id)
  end

end