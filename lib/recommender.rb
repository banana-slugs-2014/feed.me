class Recommender

  attr_reader :strategy, :user

  def initialize(user, opts = {})
    @user = user
    @strategy = (opts[:strategy] || SimpleGooglePlaces).create
  end


  def recommend
    place = strategy.recommend
    Recommendation.create(place: place, recommendation_strategy: strategy, user: user)
  end

end