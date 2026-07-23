FactoryBot.define do
  factory :tournament do
    name { Faker::Sport.new rescue "Champions Cup" }
    host_country { Faker::Address.country }
    year { Faker::Number.between(from: 2000, to: 2026).to_s }
  end
end
