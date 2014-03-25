require 'spec_helper'

describe FacebookWeighted do
  let(:my_user){ create(:user, age_range: 21) }
  let(:my_place) { create(:place) }
  let(:beer_place) { create(:place, types: ['Brewery']) }
  let(:pizza_place) { create(:place, types: ['Pizza Place']) }
  let(:mexican_place) { create(:place, types: ['Mexican Restaurant']) }
  let(:grocery_place) { create(:place, types: ['Grocery Store']) }
  let(:my_places){ [beer_place, pizza_place, mexican_place, grocery_place, my_place] }
  let(:my_recommender) { Recommender.new(my_user,[my_place]) }
  let(:my_age_recommender) { Recommender.new(my_user,my_places) }
  let(:fb_weighted){ create(:facebook_weighted) }

  context '#recommend' do
    it "should return a place" do
      expect(fb_weighted.recommend(my_recommender)).to be_an_instance_of Place
    end

    it "should return a place the user is 21" do
      expect(fb_weighted.recommend(my_age_recommender)).to be_an_instance_of Place
    end
  end
end