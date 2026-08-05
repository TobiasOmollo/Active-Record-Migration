FactoryBot.define do
  factory :goal do
    match
    team { match.team_a }
    minute { rand(1..90) }

    association :scorer, factory: :player

    trait :with_assist do
      association :assist, factory: :player
    end
  end
end