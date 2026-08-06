FactoryBot.define do
  factory :card do
    player
    match
    card_type { Card.card_types[:yellow]}
    minute { rand(1..90) }

    trait :yellow do
      card_type { Card.card_types[:yellow]}
    end

    trait :red do
      card_type { Card.card_types[:red]}
    end
  end
end