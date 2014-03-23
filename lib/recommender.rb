class Recommender

  attr_reader :strategy, :user

  def initialize(user, opts)
    @user = user
    @strategy = (opts[:strategy] || SimpleGooglePlaces).create
  end


  def recommend
    place = strategy.recommend(self)
    Recommendation.create(place: place, strategy: strategy, user: user)
  end

end