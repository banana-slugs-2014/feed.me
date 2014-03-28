class RecommendationsController < ApplicationController
  after_filter :update_recommendable_redis, only: :update

  def update
    if params[:yes]
      like_true!
      recommendation = Recommendation.where(id: params[:id]).first
      render partial: 'recommendations/thankyou', locals: {place: recommendation }
    elsif params[:no]
      like_false!
      places = Place.last(28)

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