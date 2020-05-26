# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#faking users

# puts 'Creating 25 fake users...'
# 25.times do
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email:    Faker::Internet.email,
#     role: ["provider", "customer"].sample
#     )
#   user.save!
# end

puts 'Creating 30 services...'

30.times do
  service = Service.new(
    name: Faker::Game.genre ,
    description: Faker::GreekPhilosophers.quote,
    price: rand(20..125),
    image: Faker::LoremPixel.image(size: "200x300", is_gray: false, category: 'abstract'),
    category:Faker::Game.title,
    user_id: User.first
    )
  service.save!
end

puts 'Fake services finished!'


