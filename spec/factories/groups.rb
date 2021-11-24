FactoryBot.define do
  factory :group do
    name { Faker::String.random(length: 3..12) }
    icon { 'Food' }
    user_id { Faker::Number.within(range: 1..10) }
  end
end
