FactoryGirl.define do
  factory :user do
    provider "facebook"
    uid "12345"
    name "Johnny Wu"
    # what do these need to be??
    # oauth_token
    # oauth_expires_at
  end

  factory :place do
    name "Something"
    address "Somewhere"
    types ["food", "otherfood"]
    latitude 123
    longitude 122
  end
end