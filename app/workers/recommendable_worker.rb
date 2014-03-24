class RecommendableWorker
  include Sidekiq::Worker

  def perform(user, place)
    user.like place
  end


end