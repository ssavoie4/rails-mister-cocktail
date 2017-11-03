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
Dose.delete_all
Cocktail.delete_all
Ingredient.delete_all


puts "Creating ingredients..."
ingredients["drinks"].each do |ing|
  ingredient = Ingredient.new(name: ing["strIngredient1"])
  ingredient.save!
end

puts "Creating cocktails..."

attributes = [
  [{ name: "Mint Julep" }, "http://www.foodrepublic.com/wp-content/uploads/2011/05/mint_julep.jpg"],
  [{ name: "Whiskey Sour" }, "https://fthmb.tqn.com/78riQ3qC2d6knCFXhjgXl-kLKog=/960x0/filters:no_upscale()/ScotchSour-463383447-56a172b15f9b58b7d0bf5fbb.jpg"],
  [{ name: "Mojito" }, "http://d3k19ysnp189dx.cloudfront.net/wp-content/uploads/2016/12/Mason-Jar-Mojitos-4-Ways-2.jpg"],
  [{ name: "Bloody Ceasar" }, "https://images.ricardocuisine.com/services/recipes/500x675_754709016547606795e901.jpg"],
  [{ name: "White Russian" }, "http://www.simplyrecipes.com/wp-content/uploads/2016/12/2016-12-25-CoconutWhiteRussian-8.jpg"],
  [{ name: "Frozen Margatia"}, "https://cdn.liquor.com/wp-content/uploads/2017/07/05150949/Frozen-Margarita-720x720-recipe.jpg"]
]

attributes.each do |attr|
  cocktail = Cocktail.new(attr[0])
  cocktail.save!
  cocktail.photo_url = attr[1]
end

puts "Finished!"
