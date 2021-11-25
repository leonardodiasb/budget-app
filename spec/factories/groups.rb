FactoryBot.define do
  factory :group do
    name { Faker::Movies::StarWars.character }
    icon { 'Food' }
    user_id { Faker::Number.within(range: 1..10) }
  end
end
