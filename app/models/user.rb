class User < ActiveRecord::Base

validates :uid, presence: true, uniqueness: true
validates :oauth_token, presence: true
has_many :user_places
has_many :places, through: :user_places
end