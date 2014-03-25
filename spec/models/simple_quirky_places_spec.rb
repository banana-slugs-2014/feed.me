require 'spec_helper'

describe SimpleQuirkyPlaces do
  let(:quirky){ create(:quirky) }
  let(:recommendation){ create(:recommendation) }
  context '#recommend' do
    it 'returns one place' do
      recommendation.like_recommendation
      expect(quirky.recommend).to be_an_instance_of Place
    end
  end
end