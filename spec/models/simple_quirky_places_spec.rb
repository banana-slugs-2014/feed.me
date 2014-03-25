require 'spec_helper'

describe SimpleQuirkyPlaces do
  let(:quirky){ create(:quirky) }
  let(:recommendation){ create(:recommendation) }
  let(:my_user){ create(:user) }
  let(:my_place){ create(:place) }
  let(:my_recommender){ Recommender.new(my_user, [my_place]) }
  context '#recommend' do
    it 'returns one place' do
      recommendation.like_recommendation
      expect(quirky.recommend(my_recommender)).to be_an_instance_of Place
    end
  end
end