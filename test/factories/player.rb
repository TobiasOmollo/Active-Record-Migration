FactoryBot.define do
  factory :player do
    code { Faker::Alphanumeric.alpha(number: 6) }
    name { Faker::Name.name }
    date_of_birth { Faker::Date.between(from: '1980-09-23', to: '2000-09-25') }
    country_of_origin { "Kenya" }
  end
end
