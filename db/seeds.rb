# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning data..."
Comment.destroy_all
Item.destroy_all
User.destroy_all
puts "Finished cleaning data."
puts "Creating data..."

micah = User.create!(
  first_name: "Micah",
  last_name: "Hobbs",
  email: "micah@email.com",
  password: "password",
  password_confirmation: "password",
  profile_visible: true,
)

phil = User.create!(
  first_name: "Phil",
  last_name: "Tan",
  email: "phil@email.com",
  password: "password",
  password_confirmation: "password",
  profile_visible: true,
)

lachy = User.create!(
  email: "lachy@email.com",
  password: "password",
  password_confirmation: "password",
)


item1 = Item.create!(
  name: "Samsung 75 inch 4K Smart TV",
  value: 2495,
  description: "Extraordinary colour and brightness can be yours, with Quantum Dot technology on Q60B QLED TV. The AirSlim Design offers a sleek, minimalist profile, and with Smart Connectivity, controlling and connecting entertainment and devices can be quick and seamless. Long-lasting brilliance, colourful possibilities.",
  link: "https://www.jbhifi.com.au/products/samsung-q60b-75-qled-4k-smart-tv-2022?view=tabs",
  start_date: Date.new(2022, 7, 4),
  end_date: Date.new(2022, 7, 14),
  user_id: 1,
)

item2 = Item.create!(
  name: "Samsung 75 inch 4K Smart TV",
  value: 2495,
  description: "Extraordinary colour and brightness can be yours, with Quantum Dot technology on Q60B QLED TV. The AirSlim Design offers a sleek, minimalist profile, and with Smart Connectivity, controlling and connecting entertainment and devices can be quick and seamless. Long-lasting brilliance, colourful possibilities.",
  link: "https://www.jbhifi.com.au/products/samsung-q60b-75-qled-4k-smart-tv-2022?view=tabs",
  start_date: Date.new(2022, 7, 4),
  end_date: Date.new(2022, 7, 14),
  user_id: 2,
)

item3 = Item.create!(
  name: "Samsung 75 inch 4K Smart TV",
  value: 2495,
  description: "Extraordinary colour and brightness can be yours, with Quantum Dot technology on Q60B QLED TV. The AirSlim Design offers a sleek, minimalist profile, and with Smart Connectivity, controlling and connecting entertainment and devices can be quick and seamless. Long-lasting brilliance, colourful possibilities.",
  link: "https://www.jbhifi.com.au/products/samsung-q60b-75-qled-4k-smart-tv-2022?view=tabs",
  start_date: Date.new(2022, 7, 4),
  end_date: Date.new(2022, 7, 14),
  user_id: 3,
)

50.times {
    rand_date = Faker::Date.in_date_period
    Item.create!(
    name: Faker::Commerce.product_name,
    value: Faker::Commerce.price(range: 500...9000),
    description: "I really want this."
    link: "https://www.jbhifi.com.au/products/samsung-q60b-75-qled-4k-smart-tv-2022?view=tabs",
    start_date: rand_date,
    end_date: rand_date + 10,
    user_id: [1,2,3].sample,
  )
}

puts "Seed complete."
