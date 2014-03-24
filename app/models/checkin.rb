class Checkin < ActiveRecord::Base
  attr_accessible :message, :city, :country, :latitude, :longitude, :name
  belongs_to :user, foreign_key: "uid"
end