require 'spec_helper'

describe FacebookFirstnamePlaces do
  let(:namesake){ create(:namesake) }
  let(:my_user){ create(:user) }
  let(:my_places){ [create(:place), create(:place, name: my_user.name[0]+"place")] }
  let(:my_recommender){ Recommender.new( my_user, my_places) }

  context "#recommend" do
    it "should return a place" do
      expect(namesake.recommend(my_recommender)).to be_an_instance_of Place
    end

    it "should return a place matching firstname letter when possible" do
      expect(namesake.recommend(my_recommender).name[0]).to eq(my_user.name[0])
    end
  end
end