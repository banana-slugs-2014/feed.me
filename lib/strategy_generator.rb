class StrategyGenerator

  attr_reader :strategies

  def initialize
    @strategies = RecommendationStrategy.descendants
  end


  def generate
    ab_test("Recommendation Strategy", *strategies)
  end

end