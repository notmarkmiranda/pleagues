FactoryBot.define do
  factory :membership do
    user { nil }
    league { nil }
    role { 1 }
    status { 1 }
  end
end
