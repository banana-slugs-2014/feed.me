require 'spec_helper'
require_relative 'fsq_stub'

describe PlacesController do
  describe '#create' do
    let(:attribs) {FactoryGirl.attributes_for :place}
    let(:my_user){FactoryGirl.create :user, age_range: 21}
    let!(:my_recommendation) { create(:recommendation) }

    before(:each) do
      controller.stub(:get_places_from_foursquare){FSQ_STUB}
      controller.stub(:current_user){ my_user }
      controller.stub(:get_places_from_foursquare){FSQ_STUB}
    end

    it "should render a partial" do
        post :create, userLocation: {latitude: 37.78, longitude: 122.4167}.to_json
        expect(response).to render_template(partial: "places/_show")
    end

    it 'creates places' do
      expect{
        post :create, userLocation: {latitude: 12, longitude: 33}.to_json
      }.to change{ Place.count }
    end
  end
end