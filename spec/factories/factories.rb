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
end