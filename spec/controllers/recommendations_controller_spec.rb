require 'spec_helper'

describe RecommendationsController do

  describe '#update' do

    let(:my_recommendation){ create(:recommendation) }
    let(:my_user){ create(:user, age_range: 21) }

    context 'user likes a recommendation' do

      before(:each) do
        controller.stub(:current_user){ my_user }
        put :update, id: my_recommendation.id, yes: "Yes!"
      end

      it 'changes the recommendation like to true' do
        expect(my_recommendation.reload.like).to be_true
      end
    end

    context 'user dislikes a recommendation' do

      before(:each) do
        controller.stub(:current_user){ my_user }
        put :update, id: my_recommendation.id, no: "No!"
      end

      it 'changes the recommendation like to true' do
        expect(my_recommendation.reload.like).to be_false
      end
    end
  end
end