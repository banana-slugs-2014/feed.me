require 'spec_helper'

describe PlacesController do
  describe '#create' do
    let(:attribs) {FactoryGirl.attributes_for :place}

    it "should render a partial" do
        post :create, places: [attribs].to_json
        response.should render_template(partial: "places/_show")
    end
    it 'initializes places without creating new ones' do
      expect{
        post :create, places: [attribs].to_json
      }.to_not change{ Place.count }
    end
  end
end