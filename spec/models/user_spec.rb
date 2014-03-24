require 'spec_helper'

describe User do
  let!(:myuser){FactoryGirl.create :user}
  context "validations" do
    it {should validate_presence_of :uid}
    it {should validate_uniqueness_of :uid}
    it {should validate_presence_of :oauth_token}
  end

  context "mass assignment (attr_accessible)" do
    it {should allow_mass_assignment_of :name}
    it {should allow_mass_assignment_of :recent_latitude}
    it {should allow_mass_assignment_of :recent_longitude}
    it {should allow_mass_assignment_of :age_range}
    it {should allow_mass_assignment_of :location}
    it {should allow_mass_assignment_of :gender}
  end

  context "relations" do
    it { should have_many :places}
    it { should have_many :recommendations}
    it { should have_many(:places).through(:recommendations)}
    it { should have_many :checkins}
    it { should have_many :user_likes}
  end
end