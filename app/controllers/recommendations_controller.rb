class RecommendationsController < ApplicationController
  # after_filter :update_recommendable_redis, only: :update

  # I think we should use new, create, and edit actions here
  # for the core user experience instead of places actions.

  def update
    if params[:yes]
      like_true!
      render partial: 'recommendations/thankyou'
    elsif params[:no]
      like_false!
      @places = Place.last(10)
      @recommendation = Recommendation.last(2).first
      render partial: 'places/show', locals: {places: @places, recommendation: @recommendation}
    end
  end

  # METHODS
  def like_true!
    @liked = Recommendation.where(id: params[:id]).first
    @liked.update_attributes(like: true)
    update_recommendable_redis @liked
  end

  def like_false!
    @disliked = Recommendation.where(id: params[:id]).first
    @disliked.update_attributes(like: false)
  end

  private

  def update_recommendable_redis recommendation
    current_user.like recommendation.place
    Recommendable::Workers::Sidekiq.perform_async(current_user.id)
  end

end