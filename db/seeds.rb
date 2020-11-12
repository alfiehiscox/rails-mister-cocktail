# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts "Clearing Ingredients Database"
Ingredient.destroy_all

puts "Creating ingredients!"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
serialized = open(url).read
ingredients_hash = JSON.parse(serialized)

ingredients = ingredients_hash["drinks"]
ingredients.each do |hash|
  puts "Ingredient Created"
  Ingredient.create(name: "#{hash["strIngredient1"]}")
end
