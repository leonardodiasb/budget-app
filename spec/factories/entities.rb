FactoryBot.define do
  factory :entity do
    name { Faker::String.random(length: 3..12) }
    amount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    user_id { Faker::Number.within(range: 1..10) }
  end
end
