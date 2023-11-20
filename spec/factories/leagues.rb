FactoryBot.define do
  factory :league do
    name { Faker::FunnyName.two_word_name }
    location { Faker::Address.community }
    public_league { false }
  end
end
