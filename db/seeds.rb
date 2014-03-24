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