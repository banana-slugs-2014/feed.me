require 'spec_helper'

describe FacebookWeighted do
  let(:my_user){ create(:user) }
  let(:my_place) { create(:place) }
  let(:my_recommender) { Recommender.new(my_user,[my_place]) }
  let(:fb_weighted){ create(:facebook_weighted) }

  context '#recommend' do
    it "should return a place" do
      fb_weighted.stub(:weighted_random){my_place}
      expect(fb_weighted.recommend(my_recommender)).to be_an_instance_of Place
    end
  end
end