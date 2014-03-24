FactoryGirl.define do
  factory :user do
    uid {Faker::Number.number(10)}
    name nil
    age_range nil
    location nil
    gender nil
    oauth_token "1234567890asdfghjkl"
  end

  factory :user_attribs, class: User do
    userID {Faker::Number.number(10)}
    accessToken "1234567890asdfghjkl"
  end

  factory :place do
    name {Faker::Name.name}
    address {Faker::Address.city}
    types ["food", "otherfood"]
    latitude 123
    longitude 122
  end

  factory :recommendation_place, class: Place do
    name "Test"
    address "123 Fake Avenue"
    types ["food", "otherfood"]
    latitude 123
    longitude 122
  end

  factory :recommendation do
    association :place, factory: :recommendation_place
    user
    recommendation_strategy
  end

  factory :recommendation_strategy do
    name 'test strategy'
    type 'test'
  end

  factory :quirky, class: SimpleQuirkyPlaces do
  end

end