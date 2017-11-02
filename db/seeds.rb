# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts "Cleaning database..."
Ingredient.delete_all
Cocktail.delete_all

puts "Creating ingredients..."
ingredients["drinks"].each do |ing|
  ingredient = Ingredient.new(name: ing["strIngredient1"])
  ingredient.save!
end

puts "Creating cocktails..."

attributes = [
  { name: "Mint Julep" },
  { name: "Whiskey Sour" },
  { name: "Mojito" },
  { name: "Ceasar" },
  { name: "White Russian" },
]

attributes.each { |attr| Cocktail.create(attr)}

puts "Finished!"
