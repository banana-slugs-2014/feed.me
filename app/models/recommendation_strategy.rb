class RecommendationStrategy < ActiveRecord::Base
  has_many :recommendations

  def recommend
    raise "You found the abstract class! Implement #{__method__} on a subclassed recommendation strategy."
  end
end