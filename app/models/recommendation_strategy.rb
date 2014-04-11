class RecommendationStrategy < ActiveRecord::Base
  has_many :recommendations

  def recommend(data)
    raise "You found the abstract class! Implement #{__method__} on a subclassed recommendation strategy."
  end

  @strategies = []
  class << self

    attr_reader :strategies
    
    def inherited(subclass)
      @strategies << subclass.to_s
    end

  end

end