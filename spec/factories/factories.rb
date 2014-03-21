FactoryGirl.define do
  factory :user do
    uid {Faker::Number.number(10)}
    name {Faker::Lorem.word}
    oauth_token {Faker::Base.letters}
  end
end