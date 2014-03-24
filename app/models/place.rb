class Place < ActiveRecord::Base
  attr_accessible :name, :address, :types, :latitude, :longitude, :menu_url, :phone_num, :company_url, :postal_code
  serialize :types
  has_many :recommendations
  has_many :users, through: :recommendations

  validates :name, :address, uniqueness: true
end