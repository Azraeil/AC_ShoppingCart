# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user = User.create(name:"Admin", email:"admin@shopping.com", password:"aliqua summis", role:"Admin")

user = User.create(name:"Administrator", email:"admin@test.com", password:"123123", role:"Admin")

puts "Admin accounts created!"
