require 'spec_helper'

describe RecommendableStrategy do

  let(:recommendable) { create(:recommendable_strategy) }
  let(:my_recommender) { build(:recommender) }
  let(:my_place) { create(:place) }

  context '#recommend' do
    it 'returns one place' do
      my_recommender.user.stub(:recommended_places) { [my_place] }
      expect(recommendable.recommend(my_recommender)).to be_a_kind_of Place
    end
  end
end