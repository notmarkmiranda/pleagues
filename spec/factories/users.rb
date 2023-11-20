FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    first_name { "Mark" }
    last_name { "Miranda" }
    nickname { "Howdy" }
    password { "password" }
  end
end
