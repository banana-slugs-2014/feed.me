class Recommender

  attr_reader :strategy, :user, :places

  def initialize(user, places, opts = {})
    @user = user
    @places = places
    @strategy = (opts[:strategy] || SimpleFourSquare).create
  end


  def recommend
    place = strategy.recommend(self)
    Recommendation.create(place: place, recommendation_strategy: strategy, user: user)
  end

end