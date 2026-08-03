FactoryBot.define do
  factory :card do
    player
    match
    card_type { "yellow" }
  end
end