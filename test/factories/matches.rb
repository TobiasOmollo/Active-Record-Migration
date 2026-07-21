FactoryBot.define do
  factory :match do
    association :team_a, factory: :team
    association :team_b, factory: :team
    association :tournament

    date { Faker::Date.between(from: '2024-01-01', to: '2026-12-31') }
    venue { Faker::Address.city }
    referee { Faker::Name.name }
    match_type { %w[friendly qualifier group_stage knockout final].sample }
  end
end
