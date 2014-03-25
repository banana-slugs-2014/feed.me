module StrategyTester

  def self.strategies
    RecommendationStrategy.all
    RecommendationStrategy.subclasses.map(&:to_s)
  end

end
