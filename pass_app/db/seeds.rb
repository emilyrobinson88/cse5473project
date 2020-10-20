# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
# will be using web scraping probably eventually? but for now just this to show how password bank will work

CommonPassword.create(password:'123456', rank:1)
CommonPassword.create(password:'password', rank:2)
