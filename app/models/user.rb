class User < ActiveRecord::Base

  attr_accessible :uid, :oauth_token,:name, :recent_latitude, :recent_longitude, :age_range, :location, :gender

  validates :uid, presence: true, uniqueness: true
  validates :oauth_token, presence: true
  has_many :user_places
  has_many :places, through: :recommendations
  has_many :checkins
  has_many :user_likes
  has_many :recommendations
end