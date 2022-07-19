# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"

puts "Cleaning data..."
Comment.destroy_all
Item.destroy_all
User.destroy_all
puts "Finished cleaning data."
puts "Creating data..."

def create_items(min, max, user)
  (min..max).to_a.sample.times do
    Item.create!(
      name: [Faker::Vehicle.make_and_model, Faker::House.room.capitalize + " " + Faker::House.furniture, Faker::Drone.name].sample,
      value: Faker::Number.between(from: 100, to: 10000),
      description: Faker::Lorem.sentence,
      link: Faker::Internet.url(host: 'faker', path: '/fake_test_path', scheme: 'https'),
      reason: ['Fun', 'Fitness', 'Productivity', 'Technology', 'Other'].sample,
      start_date: Faker::Date.between(from: '2022-07-18', to: '2022-07-25'),
      end_date: Faker::Date.between(from: '2022-07-26', to: '2022-08-15'),
      status: ['Cooling off', 'Bought', 'Abandoned'].sample,
      user_id: user.id
    )
  end
end

lachy = User.create!(
  first_name: "Lachlan",
  last_name: "Munro",
  username: "lachy",
  email: "lachy@email.com",
  password: "password",
  password_confirmation: "password",
  profile_visible: true,
)
lachy.avatar.attach(io: File.open("./app/assets/images/avatars/lachy.jpeg"), filename: "lachy.jpeg", content_type: 'image/jpeg')

create_items(5, 10, lachy)

micah = User.create!(
  first_name: "Micah",
  last_name: "Hobbs",
  username: "micahthobbs",
  email: "micah@email.com",
  password: "password",
  password_confirmation: "password",
  profile_visible: true,
)
micah.avatar.attach(io: File.open("./app/assets/images/avatars/micah.jpeg"), filename: "micah.jpeg", content_type: 'image/jpeg')

create_items(5, 10, micah)

# RIP PHIL
# phil = User.create!(
#   first_name: "Phil",
#   last_name: "Tan",
#   username: "philtan",
#   email: "philcode40@gmail.com",
#   password: "password",
#   password_confirmation: "password",
#   profile_visible: true,
# )

10.times do |count|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    username: first_name + last_name,
    email: "#{first_name}@email.com",
    password: "password",
    password_confirmation: "password",
    profile_visible: true,
)
  user.avatar.attach(io: File.open("./app/assets/images/avatars/avatar#{count + 1}.jpeg"), filename: "avatar#{count + 1}.jpeg", content_type: 'image/jpeg')
  create_items(5, 10, user)
end

# Leaving for history lol
# item1 = Item.create!(
#   name: "Samsung 75 inch 4K Smart TV",
#   value: 2495,
#   description: "Extraordinary colour and brightness can be yours, with Quantum Dot technology on Q60B QLED TV. The AirSlim Design offers a sleek, minimalist profile, and with Smart Connectivity, controlling and connecting entertainment and devices can be quick and seamless. Long-lasting brilliance, colourful possibilities.",
#   link: "https://www.jbhifi.com.au/products/samsung-q60b-75-qled-4k-smart-tv-2022?view=tabs",
#   reason: "Fun",
#   status: "Cooling off",
#   start_date: Date.new(2022, 7, 4),
#   end_date: Date.new(2022, 7, 14),
#   user_id: 1,
# )

puts "Seed complete."
