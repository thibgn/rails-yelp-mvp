# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."

5.times do
  resto = Restaurant.create!({ name: Faker::Restaurant.name, address: Faker::Address.street_address, category: CATEGORIES.sample })
  resto.save
  puts ("#{resto.name} created!")
end

puts 'Creating reviews'

20.times do
  restaurant = Restaurant.all.sample
  review = Review.create({
    content: Faker::Restaurant.review,
    rating: rand(0..5),
    restaurant_id: restaurant.id
  })
  review.save
end

puts("20 reviews created")