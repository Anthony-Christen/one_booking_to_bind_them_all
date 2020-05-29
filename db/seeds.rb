# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

#faking users
puts 'Deleting bookings...'
Booking.destroy_all
puts 'Deleting services...'
Service.destroy_all
puts 'Deleting users...'
User.destroy_all

puts 'Creating user antho...'
user = User.new(
    first_name: "Anthony",
    last_name: "Christen",
    email:    "antho@gmail.com",
    password: "123456",
    role: ["provider", "customer"].sample
    )
user.save!

puts 'Creating user Alex...'
user = User.new(
    first_name: "Alexandre",
    last_name: "Bouvier",
    email:    "alex@gmail.com",
    password: "azerty",
    role: ["provider", "customer"].sample
    )
user.save!

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

service = Service.new(
  name: "Fortnite",
  description: "pro player level 100",
  price: rand(30..150),
  category: Faker::Game.genre,
  user: User.all.sample
  )
file = URI.open("https://cdn2.unrealengine.com/Fortnite%2Fhome-v2%2FASPOT_Image-3840x2308-35330d4be45373960682e7ef88da5b4c2d8e790f.jpg")
service.photo.attach(io: file, filename: 'Fortnite', content_type: 'image/jpg')
service.save!

service = Service.new(
  name: "Call Of Duty",
  description: "Want to new skins we get them for you.",
  price: 30,
  category: Faker::Game.genre,
  user: User.all.sample
  )
file = URI.open("https://www.activision.com/content/dam/atvi/callofduty/cod-touchui/warzone/social/wz-social-share.jpg")
service.photo.attach(io: file, filename: 'Call Of Duty', content_type: 'image/jpg')
service.save!

service = Service.new(
  name: "Rainbow Six",
  description: "Gain extra money for skins and leagues",
  price: rand(30..150),
  category: Faker::Game.genre,
  user: User.all.sample
  )
file = URI.open("https://www.digiseller.ru/preview/748667/p1_2597316_e69f5bd8.jpg")
service.photo.attach(io: file, filename: 'The divison', content_type: 'image/jpg')
service.save!

service = Service.new(
  name: "The divison",
  description: "Unlock new parts of the map",
  price: 30,
  category: Faker::Game.genre,
  user: User.all.sample
  )
file = URI.open("https://cdn-cf.gamivo.com/image_cover.jpg?f=1459&n=c8eb7380-7850-11e7-8203-abacaa3272cd.jpg&h=db5af4eb5a0056309f5454984b7da486")
service.photo.attach(io: file, filename: 'The divison', content_type: 'image/jpg')
service.save!

service = Service.new(
  name: "Great Theft Auto",
  description: "gain rp and cash",
  price: rand(30..150),
  category: Faker::Game.genre,
  user: User.all.sample
  )
file = URI.open("https://www.use-media.com/admin/files/pictures/2283/2283_4196_750_gta-5-artikelbild.jpg")
service.photo.attach(io: file, filename: 'Great Theft Auto', content_type: 'image/jpg')
service.save!

service = Service.new(
  name: "Mario",
  description: "Stuck at a certain level or just want to duo",
  price: 30,
  category: Faker::Game.genre,
  user: User.all.sample
  )
file = URI.open("https://cdn02.nintendo-europe.com/media/images/10_share_images/games_15/nintendo_switch_4/H2x1_NSwitch_NewSuperMarioBrosUDeluxe_image1600w.jpg")
service.photo.attach(io: file, filename: 'FiFa', content_type: 'image/jpg')
service.save!

service = Service.new(
  name: "FiFa",
  description: "Do you want to be part of the Frist League",
  price: rand(30..150),
  category: Faker::Game.genre,
  user: User.all.sample
  )
file = URI.open("https://image-cdn.essentiallysports.com/wp-content/uploads/20200418223918/fifa-20-button-2020-1568061446797-1600x1600.jpg")
service.photo.attach(io: file, filename: 'FiFa', content_type: 'image/jpg')

service.save!

service = Service.new(
  name: "The Last Of Us",
  description: "Stuck on a certain level or just at a boring part",
  price: rand(30..150),
  category: Faker::Game.genre,
  user: User.all.sample
  )

file = URI.open("https://nationeditions.com/wp-content/uploads/2020/03/lastofus-696x442.jpg")
service.photo.attach(io: file, filename: 'TheLastOfUs', content_type: 'image/jpg')
service.save!

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


