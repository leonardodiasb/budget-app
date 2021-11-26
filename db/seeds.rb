# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

leo = User.create!(
  name: 'Leonardo',
  email: 'leo@user.com',
  password: 'password',
  password_confirmation: 'password'
)

market = Group.create!(
  name: 'Market',
  icon: 'Food',
  user_id: leo.id
)

travel = Group.create!(
  name: 'Travel',
  icon: 'Transportation',
  user_id: leo.id
)

cocacola = Entity.create!(
  name: 'Coca-Cola',
  amount: 10,
  user_id: leo.id
)

market.entities << cocacola

meat = Entity.create!(
  name: 'Meat',
  amount: 9,
  user_id: leo.id
)

market.entities << meat

trip1 = Entity.create!(
  name: 'Gasoline',
  amount: 23,
  user_id: leo.id
)

travel.entities << trip1