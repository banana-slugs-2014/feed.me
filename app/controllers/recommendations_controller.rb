class RecommendationsController < ApplicationController
  after_filter :update_recommendable_redis, only: :update

  def update
    if params[:yes]
      like_true!
      recommendation = Recommendation.where(id: params[:id]).first
      render partial: 'recommendations/thankyou', locals: {place: recommendation }
    elsif params[:no]
      like_false!
      nearby_longitude = (current_user.recent_longitude - 0.02)..(current_user.recent_longitude + 0.02)
      nearby_latitude = (current_user.recent_latitude - 0.02)..(current_user.recent_latitude + 0.02)
      places = Place.where(longitude: nearby_longitude).where(latitude: nearby_latitude).shuffle.last(28)

      trial = ab_test('Recommendation Strategy', *StrategyTester.strategies).constantize
      recommendation = Recommender.new(current_user, places, strategy: trial).recommend

      render partial: 'newplace', locals: { recommendation: recommendation}
    end
  end

  def like_true!
    recommendation = Recommendation.where(id: params[:id]).first
    recommendation.update_attributes(like: true)
    current_user.like recommendation.place
    finished('Recommendation Strategy')
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