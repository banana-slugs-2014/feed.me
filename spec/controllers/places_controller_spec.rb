require 'spec_helper'

describe PlacesController do
  describe "#index" do
    it 'is okay' do
      get :index
      expect(response.status).to be(200)
    end
  end

  describe '#create' do
    let(:place){ places: {name: "Jar", address: "123", types: ["red", "green"], latitude: 1, longitude: 2 }
    it 'is okay' do
      get :create, :place
      expect(response).to be_redirect
    end

    it 'assigns the places var' do
      get :create, :place
      expect(assigns(:place)).to be_a_new Place
    end
  end
end