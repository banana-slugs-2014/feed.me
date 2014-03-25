class RecommendationsController < ApplicationController
  after_filter :update_recommendable_redis, only: :update

  # I think we should use new, create, and edit actions here
  # for the core user experience instead of places actions.

  def update
    like_true
     redirect_to root_path
  end

  def like_true
    p "*" * 100
    p params
    @liked = Recommendation.where(params[:id]).first
    @liked.update_attributes(like: true)
  end

  def like_false
    @disliked = Recommendation.where(params[:id]).first
    @disliked.update_attributes(like: false)
  end

  private

  def update_recommendable_redis
    current_user.like @recommendation.place
    Recommendable::Workers::Sidekiq.perform_async(current_user.id)
  end

end