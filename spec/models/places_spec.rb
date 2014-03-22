require 'spec_helper'

describe Place do
  context "relations" do
    it {should have_many :users}
    it {should have_many :user_places}
    it {should have_many(:users).through :user_places}
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
 end