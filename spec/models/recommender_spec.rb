require 'spec_helper'

describe Recommender do
  let(:my_strategy){ create(:recommendation_strategy) }
  let(:my_user){ create(:user) }
  let(:my_place){ create(:place) }
  let(:my_recommender){ Recommender.new(my_user) }
  let(:invalid_recommender){ Recommender.new }
  context '#initialize' do
    context 'valid params' do
      it 'returns a recommender' do
        expect(my_recommender).to be_a_kind_of Recommender
      end
    end

    context 'invalid params' do
      it 'does not return a recommender' do
        expect{ invalid_recommender }.to raise_error
      end
    end

  end

  context "#recommend" do
    it 'returns a recommendation' do
      my_recommender.strategy.stub(:recommend) { my_place }
      expect(my_recommender.recommend).to be_a_kind_of Recommendation
    end
  end

end