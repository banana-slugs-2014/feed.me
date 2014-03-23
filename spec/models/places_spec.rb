require 'spec_helper'

describe Place do
  context "relations" do
    it {should have_many :users}
    it {should have_many :recommendations}
    it {should have_many(:users).through :recommendations}
  end

  context "serialize" do
    it {should serialize :types}
  end

  context "mass assignment (attr_accessible)" do
    it {should allow_mass_assignment_of :name}
    it {should allow_mass_assignment_of :address}
    it {should allow_mass_assignment_of :types}
    it {should allow_mass_assignment_of :latitude}
    it {should allow_mass_assignment_of :longitude}
  end

  context "validations" do
    it 'validates uniqueness of name' do
      Place.new(name: 'test', address: 'somewhere').save!(validate: false)
      should validate_uniqueness_of :name
    end

    it 'validates uniqueness of address' do
      Place.new(name: 'test', address: 'somewhere').save!(validate: false)
      should validate_uniqueness_of :address
    end
  end
 end
