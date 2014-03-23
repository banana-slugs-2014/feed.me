require 'spec_helper'

describe Recommender do
  let(:my_strategy){ create(:strategy) }
  let(:attribs){ { strategy: my_strategy, user: create(:user) } }
  let(:my_place){ create(:place) }

  context '#initialize' do
    context 'valid params' do
      it 'returns a recommender' do
        expect(Recommender.new(attribs)).to be_a_kind_of Recommender
      end
    end

    context 'invalid params' do
      it 'does not return a recommender' do
        expect{Recommender.new}.to raise_error
      end
    end

  end

  context "#recommend" do
    it 'returns a recommendation' do
      my_strategy.stub(:recommend) { my_place }
      expect(Recommender.new(attribs).recommend).to be_a_kind_of Recommendation
    end
  end

end