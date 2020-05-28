# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#faking users

puts 'Creating 12 fake users...'
12.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email:    Faker::Internet.email,
    password: "password",
    role: ["provider", "customer"].sample
    )
  user.save!
end
puts 'Fake users finished!'


puts 'Creating 10 services...'
10.times do
  service = Service.new(
    name: Faker::Game.title,
    description: Faker::GreekPhilosophers.quote,
    price: rand(20..125),
    image: Faker::LoremPixel.image(size: "200x300", is_gray: false, category: 'abstract'),
    category:Faker::Game.genre,
    user: User.all.sample
    )
  service.save!
end

puts 'Creating 10 bookings...'
8.times do
  booking = Booking.new(
    date:Faker::Date.in_date_period(month: 2),
    statut: ["pending", "confirmed", "cancelled"].sample,
    duration: [30, 60, 120, 180].sample,
    service:  Service.all.sample,
    user: User.all.sample
    )
  booking.save!
end
puts 'Fake booking finished!'

