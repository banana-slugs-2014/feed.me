class User < ActiveRecord::Base

validates :uid, presence: true, uniqueness: true
validates :oauth_token, presence: true
end