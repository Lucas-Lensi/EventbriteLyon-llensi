# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
Attendance.destroy_all

30.times do |index|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  password = Faker::Internet.password
  User.create(
    email: "#{first_name.downcase}.#{last_name.downcase}@yopmail.com",
    password: password,
    password_confirmation: password,
    description: Faker::Lorem.paragraph,
    first_name: first_name,
    last_name: last_name
  )
  puts "#{index} users created"
end

20.times do |index|
  Event.create(
    start_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    duration: 120,
    title: "Event#{index}",
    description: Faker::Lorem.paragraph,
    price: Faker::Number.between(from: 1, to: 1000),
    location: "#{Faker::Address.street_address}, Lyon",
    admin: User.find(rand(1..100))
  )
end
