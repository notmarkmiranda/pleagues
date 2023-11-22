FactoryBot.define do
  factory :membership do
    user
    league
    role { 1 }
    status { 1 }
  end
end
