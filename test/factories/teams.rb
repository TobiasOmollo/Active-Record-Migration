FactoryBot.define do
  factory :team do
    
    name { Faker::Lorem.word }
    country { Faker::Address.country }
    
  end
end
