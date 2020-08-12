# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
category = ["chinese", "italian", "japanese", "french", "belgian"]
10.times do
    rest = Restaurant.new(name: Faker::Restaurant.name ,address: Faker::Address.street_address, category: category.sample, phone_number: Faker::PhoneNumber.phone_number_with_country_code )
    p rest
    rest.save!
    10.times do 
        review = Review.new(title: Faker::Marketing.buzzwords,content: Faker::Restaurant.review, rating: rand(0...5))
        review.restaurant = rest
        p review
        review.save!
    end
end
