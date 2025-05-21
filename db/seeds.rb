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
require_relative '../app/models/restaurant'
p "destroying all restaurant records"
Restaurant.destroy_all

TIMES = 5

p "creating #{TIMES} restaurant"
TIMES.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    category: Restaurant::RESTAURANT_CATEGORIES.sample,
    phone_number: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.street_address 
    )
  restaurant.save
  p "created restaurant #{restaurant.name}"
end

p "#{TIMES} restaurants created!"
