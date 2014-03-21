class Place < ActiveRecord::Base
  attr_accessible :name, :address, :types, :latitude, :longitude
  serialize :types
  has_many :user_places
  has_many :users, through: :user_places
end