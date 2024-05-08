# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
require "open-uri"
Playtime.destroy_all
puts "playtime destroyed"
Creature.destroy_all
puts "creature destroyed"
User.destroy_all
puts "user destroyed"

files = ["https://kawaiiai.com/wp-content/uploads/2022/08/big-ears-cute-creature.jpg", "https://kawaiiai.com/wp-content/uploads/2022/08/multi-eye-kawaii-fantastical-creature.jpg", "https://kawaiiai.com/wp-content/uploads/2022/08/bioluminescence-octopus-cute.jpg", "https://kawaiiai.com/wp-content/uploads/2022/08/cute-truffle-creature-4.jpg", "https://i.pinimg.com/564x/22/c0/84/22c0847e2a809a31f04dbcd12ab1020f.jpg", "https://i.pinimg.com/564x/f3/bf/e2/f3bfe23ea8701a96220de1fd354f2b95.jpg", "https://i.pinimg.com/564x/93/6d/04/936d04459603ac05435430f1f4684dd5.jpg", "https://img.buzzfeed.com/buzzfeed-static/static/2023-08/24/16/asset/61d94becf6f2/sub-buzz-4986-1692896272-1.png?downsize=700%3A%2A&output-quality=auto&output-format=auto", "https://images.playground.com/661c2a15480047ff8511d340d160634e.jpeg", "https://storage.googleapis.com/pai-images/4209092ffcb6435f9a9acddf5b0effcc.jpeg"]

puts "starting to create"
10.times do |i|
  owner = User.create(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    location: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number
  )
  puts "user created"
  file = URI.open(files[i])
  puts "file grabbed"
  friend = Creature.new(
    name: Faker::Creature::Cat.name,
    planet_location: Faker::Space.planet,
    details: nil,
    price: rand(1..200)
  )
  puts "friend created"

  friend.photo.attach(io: file, filename: "creature#{i.to_s}.jpg", content_type: "image/jpg")
  puts "photo attached"
  friend.user = owner
  puts "owner attached"
  friend.save
  puts "creature saved"
end
