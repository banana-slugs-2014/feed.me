require 'spec_helper'

describe Checkin do
  context "mass assignment (attr_accessible)" do
    it {should allow_mass_assignment_of :message}
    it {should allow_mass_assignment_of :city}
    it {should allow_mass_assignment_of :country}
    it {should allow_mass_assignment_of :latitude}
    it {should allow_mass_assignment_of :longitude}
    it {should allow_mass_assignment_of :name}
  end

  context 'associations' do
    it {should belong_to(:user).with_foreign_key 'uid'}
  end
end