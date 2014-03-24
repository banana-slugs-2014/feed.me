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