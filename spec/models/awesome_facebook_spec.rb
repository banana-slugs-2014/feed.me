require 'spec_helper'

describe AwesomeFacebook do
  let(:my_facebook){ create(:awesome_facebook) }
  let(:my_places) { [create(:place)] }
  let(:my_user) { create(:user) }
  let(:my_recommender){ Recommender.new(my_user,my_places) }

  context '#recommend' do
    it 'should return a place' do
      expect(my_facebook.recommend(my_recommender)).to be_an_instance_of Place
    end
  end
end