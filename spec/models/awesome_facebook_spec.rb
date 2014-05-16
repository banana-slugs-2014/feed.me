require 'spec_helper'

describe AwesomeFacebook do
  let(:my_facebook){ create(:awesome_facebook) }
  let(:my_place) { create(:place) }
  let(:breakfast_place){ create(:place, types: ["Bakery"]) }
  let(:lunch_place){ create(:place, types: ["Pizza Place"]) }
  let(:my_user) { create(:user, age_range: 21) }
  let(:my_recommender){ Recommender.new(my_user, [my_place, breakfast_place, lunch_place]) }

  context '#recommend' do
    before(:each){
      PlacesController.stub(:current_user){my_user}
      }

    it 'should return a place' do
      expect(my_facebook.recommend(my_recommender)).to be_an_instance_of Place
    end

    it 'should return a time-of-day appropriate place if possible' do
      AwesomeFacebook.any_instance.stub(:breakfast?){true}
      AwesomeFacebook.any_instance.stub(:lunch?){false}
      AwesomeFacebook.any_instance.stub(:dinner?){false}
      expect(my_facebook.recommend(my_recommender).types).to include("Bakery")
    end
  end
end
