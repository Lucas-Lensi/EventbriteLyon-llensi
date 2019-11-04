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
  User.create(
    email: "#{first_name}.#{last_name}@yopmail.com",
    encrypted_password: Faker::Internet.password,
    description: Faker::Lorem.paragraph,
    first_name: first_name,
    last_name: last_name
  )
end
