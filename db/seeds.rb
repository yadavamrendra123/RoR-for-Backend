# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Helper method to generate a random description for restaurants
def random_description
  Faker::Restaurant.description
end

# Helper method to generate a random rating between 1 and 5 for restaurants
def random_rating
  rand(1..5)
end

# Clear existing records (optional, if you want to start with a clean slate)
Restaurant.delete_all

# Create 40 restaurant records
40.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    description: random_description,
    rating: random_rating
  )
end
