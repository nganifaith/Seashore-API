# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do 
  Beach.create(
    name: Faker::Company.name,
    country: Faker::Address.country,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    rating: Faker::Number.between(from: 1, to: 5),
    image: Faker::LoremPixel.image(size: "800x800", is_gray: false, category: 'nature'),
    details: Faker::Lorem.paragraph(sentence_count: 50),
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.cell_phone,
    website: Faker::Internet.url

  )
end
