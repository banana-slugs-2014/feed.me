FactoryGirl.define do
  factory :user do
    uid {Faker::Number.number(10)}
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
    type 'RecommendableStrategy'
  end

  factory :quirky, class: SimpleQuirkyPlaces do
  end

  factory :foursquare, class: SimpleFourSquare do
  end

  factory :awesome_facebook, class: AwesomeFacebook do
  end

  factory :recommendable_strategy, class: RecommendableStrategy do
  end

  factory :simple_four_square do
  end

end