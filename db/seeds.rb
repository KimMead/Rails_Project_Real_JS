# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "kim@seed.com", name: "kimmead", password: "password")
User.create(email: "karen@seed.com", name: "karen", password: "password")

Attraction.create(name: "Mount Rushmore", state_id: 1)
Attraction.create(name: "Golden Gate Bridge", state_id: 2)
Attraction.create(name: "Rodeo Drive", state_id: 2)

State.create(name: "South Dakota")
State.create(name: "California")
State.create(name: "New York")

