class Recommendation < ActiveRecord::Base

  belongs_to :user
  belongs_to :place
  belongs_to :strategy

  validates :user, :place, :strategy, presence: true

  attr_accessible :user, :strategy, :place

  # Should go in recommender
  # def recommend
  #   strategy.recommend(self)
  # end

end