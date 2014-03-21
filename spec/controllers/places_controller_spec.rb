require 'spec_helper'

describe PlacesController do
  describe "#index" do
    it 'is okay' do
      expect(response.status).to be(200)
    end
  end

  describe '#create' do
    it 'is okay' do
      expect(response.status).to be(200)
    end
  end
end