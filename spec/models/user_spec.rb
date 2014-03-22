require 'spec_helper'

describe User do
  let!(:myuser){FactoryGirl.create :user}
  context "validations" do
    it {should validate_presence_of :uid}
    it {should validate_uniqueness_of :uid}
    it {should validate_presence_of :oauth_token}
  end

  context "relations" do
    it { should have_many :places}
    it { should have_many :user_places}
    it { should have_many(:places).through(:user_places)}
  end
end