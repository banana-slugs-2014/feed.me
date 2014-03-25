require 'spec_helper'
require_relative 'fsq_stub'

describe PlacesController do
  describe '#create' do
    let(:attribs) {FactoryGirl.attributes_for :place}
    before(:each){controller.stub(:get_places_from_foursquare){FSQ_STUB}}
    it "should render a partial" do
        post :create, userLocation: {latitude: 37.78, longitude:  122.4167}.to_json
        expect(response).to render_template(partial: "places/_show")
    end

    it 'creates places' do
      expect{
        post :create, userLocation: {latitude: 12, longitude: 33}.to_json
      }.to change{ Place.count }
    end

  end
end