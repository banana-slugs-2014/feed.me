require 'spec_helper'

describe RecommendationsController do

  describe '#update' do

    let(:my_recommendation){ create(:recommendation) }
    let(:my_user){ create(:user) }

    context 'user likes a recommendation' do

      before(:each) do 
        controller.stub(:current_user){ my_user }  
        put :update, id: my_recommendation.id
      end

      it 'changes the recommendation like to true' do
        expect(my_recommendation.reload.like).to be_true
      end

      it 'passes #like message to current user for recommendable' do
        expect(controller.current_user).to receive(:like).with(my_recommendation.place)
        controller.send(:update_recommendable_redis)
      end

      it 'calls sidekiq worker to asynchronously update user preferences' do
        current_user_id = controller.current_user.id
        expect(Recommendable::Workers::Sidekiq).to receive(:perform_async).with(current_user_id)
        
        controller.send(:update_recommendable_redis)
      end
    end
  end



end