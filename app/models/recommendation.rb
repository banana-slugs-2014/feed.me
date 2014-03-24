class Recommendation < ActiveRecord::Base

  belongs_to :user
  belongs_to :place
  belongs_to :recommendation_strategy

  validates :user, :place, :recommendation_strategy, presence: true

  attr_accessible :user, :recommendation_strategy, :place, :like

  def like_recommendation
    update_attributes(like: true)
    self.save
  end

end