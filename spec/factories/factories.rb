FactoryGirl.define do
  factory :user do
    uid {Faker::Number.number(10)}
    name {Faker::Lorem.word}
    oauth_token "1234567890asdfghjkl"
  end

  factory :user_attribs, class: User do
    userID {Faker::Number.number(10)}
    accessToken "1234567890asdfghjkl"
  end

  factory :place do
    name "Something"
    address "Somewhere"
    types ["food", "otherfood"]
    latitude 123
    longitude 122
  end

  factory :strategy do
    name 'test strategy'
    type 'test'
  end

  factory :recommender do
    association :user, factory: :user
    association :strategy, factory: :strategy
  end
end