class RecommendationsController < ApplicationController
  after_filter :update_recommendable_redis, only: :update

  # I think we should use new, create, and edit actions here
  # for the core user experience instead of places actions.

  def update
    @recommendation = Recommendation.find(params[:id])
    @recommendation.like_recommendation

    redirect_to root_path
  end

  private

  def update_recommendable_redis
    current_user.like @recommendation.place
    Recommendable::Workers::Sidekiq.perform_async(current_user.id)
  end

end