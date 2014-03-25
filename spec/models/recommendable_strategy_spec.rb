require 'spec_helper'

describe RecommendableStrategy do

  let(:recommendable) { create(:recommendable_strategy) }
  let(:my_user){ create(:user) }
  let(:my_recommender) { Recommender.new(my_user,[my_place]) }
  let(:my_place) { create(:place) }
  let(:my_other_place){ create :place }
  let(:my_places){ [my_place, my_other_place] }

  context '#recommend' do
    context 'with a recommended place' do
      it 'returns one place' do
        my_recommender.user.stub(:recommended_places) { [my_place] }
        expect(recommendable.recommend(my_recommender)).to be_an_instance_of Place
      end
    end

    context 'without a recommended place' do
      it 'should return a place' do
        Place.stub(:last){ my_places }
        my_recommender.user.stub(:recommended_places){ nil }
        expect(my_places).to include recommendable.recommend(my_recommender)
      end
    end
  end
end