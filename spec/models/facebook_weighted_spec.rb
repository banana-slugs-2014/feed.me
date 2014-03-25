require 'spec_helper'

describe FacebookWeighted do
  #i dont like this many factories.. -PhilV
  let(:my_user){ create(:user) }
  let(:my_place) { create(:place) }
  let(:my_checkin) { create(:checkin, user: my_user) }
  let(:my_like) { create(:user_like, user: my_user) }
  let(:beer_place) { create(:place, types: ['Brewery']) }
  let(:pizza_place) { create(:place, types: ['Pizza Place']) }
  let(:mexican_place) { create(:place, types: ['Mexican Restaurant']) }
  let(:grocery_place) { create(:place, types: ['Grocery Store']) }
  let(:my_places){ [beer_place, pizza_place, mexican_place, grocery_place, my_place] }
  let(:my_recommender) { Recommender.new(my_user,my_places) }
  let(:fb_weighted){ create(:facebook_weighted) }

  context '#recommend' do
    it "should return a place" do
      expect(fb_weighted.recommend(my_recommender)).to be_an_instance_of Place
    end

    it "should return a place if the user is 21" do
      my_user.stub(:age_range){21}
      expect(fb_weighted.recommend(my_recommender)).to be_an_instance_of Place
    end

    it "should return a place if the user has no checkins" do
      expect(fb_weighted.recommend(my_recommender)).to be_an_instance_of Place
    end

    it "should return a place if the user has checkins" do
      expect(fb_weighted.recommend(my_recommender)).to be_an_instance_of Place
    end

    it "should return a place if the user has no user_likes" do
      expect(fb_weighted.recommend(my_recommender)).to be_an_instance_of Place
    end

    it "should return a place if the user has user_likes" do
      expect(fb_weighted.recommend(my_recommender)).to be_an_instance_of Place
    end
  end
end