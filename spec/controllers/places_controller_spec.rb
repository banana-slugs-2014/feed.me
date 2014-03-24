require 'spec_helper'
require_relative 'fsq_stub'

describe PlacesController do
  describe '#create' do
    let(:attribs) {FactoryGirl.attributes_for :place}
    before(:each){controller.stub(:get_places_from_foursquare){FSQ_STUB}}
    it "should render a partial" do
        post :create, userLocation: {latitude: 37.78, longitude:  122.4167}.to_json
        response.should render_template(partial: "places/_show")
    end

    it "assigns userLocation var" do
      location = {"latitude"=> 12, "longitude"=> 33}
       post :create, userLocation: {latitude: 12, longitude: 33}.to_json
      expect(assigns(:user_location)).to eq(location)
    end

    it 'initializes places without creating new ones' do
      expect{
        post :create, userLocation: {latitude: 12, longitude: 33}.to_json
        expect(assigns(:places)[0]).to be_a_new Place
      }.to_not change{ Place.count }
    end

  end
end