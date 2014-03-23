class Recommendation < ActiveRecord::Base

  belongs_to :user
  belongs_to :place
  belongs_to :recommendation_strategy

  validates :user, :place, :strategy, presence: true

  attr_accessible :user, :strategy, :place

end