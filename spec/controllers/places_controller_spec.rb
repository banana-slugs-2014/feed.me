require 'spec_helper'

describe PlacesController do
  describe '#create' do
    let(:attribs) {FactoryGirl.attributes_for :place}

    it "should render a partial" do
        post :create, places: [attribs].to_json
        response.should render_template(partial: "places/_show")
    end
    it 'creates places' do
      expect{
        post :create, places: [attribs].to_json
      }.to change{ Place.count }.by(1)
    end
  end
end