require 'spec_helper'

describe SimpleGooglePlaces do
  let(:google_place){ SimpleGooglePlaces.new }
  let(:my_place){ double :place }
  let(:my_other_place){ double :place }
  let(:my_places){ [my_place, my_other_place] }

  #lack of directly testing a_close_restaurant(private) is by design
  context '#recommend' do
    it 'should return a place' do
      Place.stub(:last){ my_places }
      expect(my_places).to include google_place.recommend("test")
    end
  end
end 