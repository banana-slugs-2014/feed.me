class Place < ActiveRecord::Base
  attr_accessible :name, :address, :types, :latitude, :longitude
  serialize :types
  has_many :recommendations
  has_many :users, through: :recommendations

  validates :name, :address, uniqueness: true
end