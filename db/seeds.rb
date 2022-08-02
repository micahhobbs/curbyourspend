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
Notification.destroy_all
puts "Finished cleaning data."
puts "Creating data..."

def create_items(min, max, user)
  (min..max).to_a.sample.times do |count|
    item_type = ["car", "furniture", "drone"].sample
    item_name = nil
    case item_type
    when "car"
      item_name = Faker::Vehicle.make_and_model
    when "furniture"
      item_name = Faker::House.furniture
    when "drone"
      item_name = Faker::Drone.name
    end
    item = Item.create!(
      name: item_name.capitalize,
      value: Faker::Number.between(from: 100, to: 10000),
      description: Faker::Lorem.sentence,
      link: Faker::Internet.url(host: 'faker', path: '/fake_test_path', scheme: 'https'),
      reason: ['Fun', 'Fitness', 'Productivity', 'Technology', 'Other'].sample,
      start_date: Faker::Date.between(from: '2022-07-15', to: '2022-07-25'),
      end_date: Faker::Date.between(from: '2022-07-20', to: '2022-07-30'),
      status: ['Cooling off', 'Bought', 'Abandoned'].sample,
      user_id: user.id
    )
    item.photo.attach(io: File.open("./app/assets/images/#{item_type}/#{item_type}#{count + 1}.jpeg"), filename: "#{item_type}#{count + 1}.jpeg", content_type: 'image/jpeg')
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

create_items(5, 8, lachy)

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

create_items(3, 7, micah)

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
  create_items(3, 6, user)
end

puts "Seed complete."
