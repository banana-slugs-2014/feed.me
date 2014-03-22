require 'spec_helper'

describe Place do
  context "relations" do
    it {should have_many :users}
    it {should have_many :user_places}
    it {should have_many(:users).through :user_places}
  end
end