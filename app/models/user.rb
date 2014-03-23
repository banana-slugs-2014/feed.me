class User < ActiveRecord::Base
attr_accessible :recent_latitude, :recent_logitude, :age_rang, :location, :gender
validates :uid, presence: true, uniqueness: true
validates :oauth_token, presence: true
has_many :user_places
has_many :places, through: :user_places
has_many :checkins
has_many :user_likes
end