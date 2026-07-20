FactoryBot.define do
  factory :team do
    
    name{Faker::Team.name}
    country { Faker::Address.country }
    
  end
end
