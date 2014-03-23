class User < ActiveRecord::Base
  attr_accessible :uid, :oauth_token, :name

  validates :uid, presence: true, uniqueness: true
  validates :oauth_token, presence: true
  has_many :recommendations
  has_many :places, through: :recommendations
end