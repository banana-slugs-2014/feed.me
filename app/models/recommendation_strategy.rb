class RecommendationStrategy < ActiveRecord::Base
  has_many :recommendations

  def recommend(data)
    raise 'implement recommend method on subclassed strategy'
  end
end