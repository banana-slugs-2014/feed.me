class UserLike < ActiveRecord::Base
  attr_accessible :category, :name
  belongs_to :user, foreign_key: "uid"
end