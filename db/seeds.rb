require 'json'
require 'net/http'
require 'uri'
require 'faker'

uri = URI.parse("http://data.sfgov.org/resource/rqzj-sfat.json")
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)
response = http.request(request)
if response.code == "200"
  result = JSON.parse(response.body)
  result.each do |food_truck |
    Place.create(name: food_truck["applicant"], address: food_truck["address"],latitude: food_truck["latitude"], longitude: food_truck["longitude"], types: food_truck["fooditems"], menu_url: food_truck["schedule"])
    puts food_truck["id"] #reference properties like this
    puts food_truck # this is the result in object form
    puts ""
    puts ""
  end
else
  puts "ERROR!!!"
end

# Reset Redis Database
`redis-cli FLUSHDB`

10.times do
  puts User.create(age_range: [13, 18, 21].sample, name: Faker::Name.name, uid: Faker::Lorem.characters(40) , oauth_token: Faker::Lorem.characters(40))
end

number_of_places = Place.all.length
places_id = [*1..number_of_places]
users_id = [*1..10]
100.times do
  Recommendation.create(place: Place.find(places_id.sample), user: User.find(users_id.sample), recommendation_strategy: SimpleFourSquare.create )
end

10.times do |time|
  number_of_places.times do
    puts User.find(time+1).like(Place.find(places_id.sample))
  end
end

10.times do |time|
  Recommendable::Helpers::Calculations.update_similarities_for(time+1)
  Recommendable::Helpers::Calculations.update_recommendations_for(time+1)
end