require 'spec_helper'

describe FacebookFirstnamePlaces do
  let(:namesake){ create(:namesake) }
  let(:my_place){ [create(:place)] }
  let(:my_user){ create(:user) }
  let(:my_recommender){ Recommender.new( my_user, my_place) } # actually probably want to mock this somehow

  context "#recommend" do
    it "should return a place" do
      expect(namesake.recommend(my_recommender)).to be_an_instance_of Place
    end
  end
end