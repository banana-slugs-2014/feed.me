require 'spec_helper'

describe PlacesController do
  describe '#create' do
    let(:attribs) {FactoryGirl.attributes_for :place}
    let(:places){FactoryGirl.create :place}


    it "should render a partial" do
      controller.stub(:get_places_from_foursquare){
        [{"id"=>"40f71a80f964a520ae0a1fe3",
  "name"=>"ThirstyBear Brewing Company",
  "contact"=>
   {"phone"=>"4159740905",
    "formattedPhone"=>"(415) 974-0905",
    "twitter"=>"thirstybearbrew"},
  "location"=>
   {"address"=>"661 Howard St",
    "crossStreet"=>"btwn 2nd & 3rd",
    "lat"=>37.78555979757354,
    "lng"=>-122.39967404803575,
    "distance"=>931,
    "postalCode"=>"94105",
    "cc"=>"US",
    "city"=>"San Francisco",
    "state"=>"CA",
    "country"=>"United States"},
  "categories"=>
   [{"id"=>"50327c8591d4c4b30a586d5d",
     "name"=>"Brewery",
     "pluralName"=>"Breweries",
     "shortName"=>"Brewery",
     "icon"=>
      {"prefix"=>"https://ss1.4sqi.net/img/categories_v2/food/brewery_",
       "suffix"=>".png"},
     "primary"=>true}],
  "verified"=>true,
  "stats"=>{"checkinsCount"=>19089, "usersCount"=>12968, "tipCount"=>142},
  "url"=>"http://www.thirstybear.com",
  "reservations"=>
   {"url"=>"http://www.opentable.com/single.aspx?rid=2&ref=9601"},
  "menu"=>
   {"type"=>"Menu",
    "label"=>"Menu",
    "anchor"=>"View Menu",
    "url"=>
     "https://foursquare.com/v/thirstybear-brewing-company/40f71a80f964a520ae0a1fe3/menu",
    "mobileUrl"=>
     "https://foursquare.com/v/40f71a80f964a520ae0a1fe3/device_menu"},
  "specials"=>
   {"count"=>1,
    "items"=>
     [{"id"=>"4ff761cb45b019248d0ad5e5",
       "type"=>"frequency",
       "message"=>"One 16 oz organic beer for $3",
       "description"=>"Unlocked every 3 check-ins",
       "icon"=>"frequency",
       "title"=>"Loyalty Special",
       "provider"=>"foursquare",
       "redemption"=>"standard"}]},
  "hereNow"=>
   {"count"=>3,
    "groups"=>
     [{"type"=>"others",
       "name"=>"Other people here",
       "count"=>3,
       "items"=>[]}]},
  "venuePage"=>{"id"=>"33954858"},
  "storeId"=>"",
  "referralId"=>"v-1395617215"}]}

        post :create, userLocation: {"latitude" => 37.78, "longitude" =>  122.4167}.to_json
        response.should render_template(partial: "places/_show")
    end

    it 'initializes places without creating new ones' do
       controller.stub(:get_places_from_foursquare){
        [{"id"=>"40f71a80f964a520ae0a1fe3",
  "name"=>"ThirstyBear Brewing Company",
  "contact"=>
   {"phone"=>"4159740905",
    "formattedPhone"=>"(415) 974-0905",
    "twitter"=>"thirstybearbrew"},
  "location"=>
   {"address"=>"661 Howard St",
    "crossStreet"=>"btwn 2nd & 3rd",
    "lat"=>37.78555979757354,
    "lng"=>-122.39967404803575,
    "distance"=>931,
    "postalCode"=>"94105",
    "cc"=>"US",
    "city"=>"San Francisco",
    "state"=>"CA",
    "country"=>"United States"},
  "categories"=>
   [{"id"=>"50327c8591d4c4b30a586d5d",
     "name"=>"Brewery",
     "pluralName"=>"Breweries",
     "shortName"=>"Brewery",
     "icon"=>
      {"prefix"=>"https://ss1.4sqi.net/img/categories_v2/food/brewery_",
       "suffix"=>".png"},
     "primary"=>true}],
  "verified"=>true,
  "stats"=>{"checkinsCount"=>19089, "usersCount"=>12968, "tipCount"=>142},
  "url"=>"http://www.thirstybear.com",
  "reservations"=>
   {"url"=>"http://www.opentable.com/single.aspx?rid=2&ref=9601"},
  "menu"=>
   {"type"=>"Menu",
    "label"=>"Menu",
    "anchor"=>"View Menu",
    "url"=>
     "https://foursquare.com/v/thirstybear-brewing-company/40f71a80f964a520ae0a1fe3/menu",
    "mobileUrl"=>
     "https://foursquare.com/v/40f71a80f964a520ae0a1fe3/device_menu"},
  "specials"=>
   {"count"=>1,
    "items"=>
     [{"id"=>"4ff761cb45b019248d0ad5e5",
       "type"=>"frequency",
       "message"=>"One 16 oz organic beer for $3",
       "description"=>"Unlocked every 3 check-ins",
       "icon"=>"frequency",
       "title"=>"Loyalty Special",
       "provider"=>"foursquare",
       "redemption"=>"standard"}]},
  "hereNow"=>
   {"count"=>3,
    "groups"=>
     [{"type"=>"others",
       "name"=>"Other people here",
       "count"=>3,
       "items"=>[]}]},
  "venuePage"=>{"id"=>"33954858"},
  "storeId"=>"",
  "referralId"=>"v-1395617215"}]}
      expect{
        post :create, userLocation: {latitude: 12, longitude: 33}.to_json
        expect(assigns(:places)[0]).to be_a_new Place
      }.to_not change{ Place.count }
    end

    it "assigns userLocation var" do
       controller.stub(:get_places_from_foursquare){
        [{"id"=>"40f71a80f964a520ae0a1fe3",
  "name"=>"ThirstyBear Brewing Company",
  "contact"=>
   {"phone"=>"4159740905",
    "formattedPhone"=>"(415) 974-0905",
    "twitter"=>"thirstybearbrew"},
  "location"=>
   {"address"=>"661 Howard St",
    "crossStreet"=>"btwn 2nd & 3rd",
    "lat"=>37.78555979757354,
    "lng"=>-122.39967404803575,
    "distance"=>931,
    "postalCode"=>"94105",
    "cc"=>"US",
    "city"=>"San Francisco",
    "state"=>"CA",
    "country"=>"United States"},
  "categories"=>
   [{"id"=>"50327c8591d4c4b30a586d5d",
     "name"=>"Brewery",
     "pluralName"=>"Breweries",
     "shortName"=>"Brewery",
     "icon"=>
      {"prefix"=>"https://ss1.4sqi.net/img/categories_v2/food/brewery_",
       "suffix"=>".png"},
     "primary"=>true}],
  "verified"=>true,
  "stats"=>{"checkinsCount"=>19089, "usersCount"=>12968, "tipCount"=>142},
  "url"=>"http://www.thirstybear.com",
  "reservations"=>
   {"url"=>"http://www.opentable.com/single.aspx?rid=2&ref=9601"},
  "menu"=>
   {"type"=>"Menu",
    "label"=>"Menu",
    "anchor"=>"View Menu",
    "url"=>
     "https://foursquare.com/v/thirstybear-brewing-company/40f71a80f964a520ae0a1fe3/menu",
    "mobileUrl"=>
     "https://foursquare.com/v/40f71a80f964a520ae0a1fe3/device_menu"},
  "specials"=>
   {"count"=>1,
    "items"=>
     [{"id"=>"4ff761cb45b019248d0ad5e5",
       "type"=>"frequency",
       "message"=>"One 16 oz organic beer for $3",
       "description"=>"Unlocked every 3 check-ins",
       "icon"=>"frequency",
       "title"=>"Loyalty Special",
       "provider"=>"foursquare",
       "redemption"=>"standard"}]},
  "hereNow"=>
   {"count"=>3,
    "groups"=>
     [{"type"=>"others",
       "name"=>"Other people here",
       "count"=>3,
       "items"=>[]}]},
  "venuePage"=>{"id"=>"33954858"},
  "storeId"=>"",
  "referralId"=>"v-1395617215"}]}
  location = {"latitude" => 12, "longitude" => 33}
   post :create, userLocation: {latitude: 12, longitude: 33}.to_json
  expect(assigns(:user_location)).to eq(location)

    end

  end
end