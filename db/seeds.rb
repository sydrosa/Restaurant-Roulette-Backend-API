# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
preferences = ["Mexican", "Italian", "Indian", "Dominican", "American", "Vegetarian", "Vegan", "Chinese", "BBQ", "Sushi", "Japanese", "Pizza", "Mediterranean", "Soul Food", "Vietnamese", "Thai"]

User.create(name: "Joe", email:"joe@gmail.com", password: "joe", password_confirmation: "joe", zipcode: 78702, radius: 5)
preferences.each do 
    |cuisine| Cuisine.create(kind: cuisine)
end
