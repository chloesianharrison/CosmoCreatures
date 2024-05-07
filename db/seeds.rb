# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'Faker'
10.times do
  owner = User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    location: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number
  )
  friend = Creature.new(
    name: Faker::Creature::Cat.name,
    planet_location: Faker::Space.planet,
    details: nil,
    price: rand(1..200)
  )
  friend.user = owner
  friend.save
end
