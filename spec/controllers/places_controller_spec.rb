require 'spec_helper'

describe PlacesController do
  describe '#create' do
    let!(:place){ create :place }

    it "should render a partial" do
        post :create, :places => [attributes_for(:place)].to_json
        response.should render_template(partial: "places/_show")
    end
    it 'initializes places without creating new ones' do
      expect{
        post :create, :places => [attributes_for(:place)].to_json
      }.to_not change{ Place.count }
    end

    it 'assigns the @places var' do
      post :create, :places => [attributes_for(:place)].to_json
      expect(assigns(:places)[0]).to be_a_new Place
    end
  end
end