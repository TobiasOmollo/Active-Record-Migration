FactoryBot.define do
  factory :card do
    player
    match
    card_type { "Y" }
    minute { rand(1..90) }

    trait :yellow do
      card_type { "Y" }
    end

    trait :red do
      card_type { "R" }
    end
  end
end