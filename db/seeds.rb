require 'json'
require 'net/http'
require 'uri'

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


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'faker'


10.times do
  puts User.create(uid: Faker::Lorem.characters(40) , oauth_token: Faker::Lorem.characters(40))
end

2500.times do
  puts Place.create(name: Faker::Lorem.characters(40), address: Faker::Lorem.characters(40))
end

places_id = [*1..1000]
10.times do |time|
  2500.times do
    puts User.find(time+1).like(Place.find(places_id.sample))
  end
end