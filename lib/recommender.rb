class Recommender

  attr_reader :strategy, :user

  def initialize(args)
    @strategy = args[:strategy]
    @user = args[:user]
  end


  def recommend
    place = strategy.recommend(self)
    Recommendation.create(place: place, strategy: strategy, user: user)
  end

end