

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredientsss = open(url).read
ingredients = JSON.parse(ingredientsss)

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

ok = Cocktail.new(name: 'Sidecar')
ok.remote_photo_url = "https://res.cloudinary.com/brykka/image/upload/v1565321032/sidecar_y9efek.jpg"
ok.save
Dose.create(cocktail: ok, ingredient: Ingredient.find_by(name: 'Creme de Cacao'), description: '1 shot')
Dose.create(cocktail: ok, ingredient: Ingredient.find_by(name: 'Port'), description: 'a splash')

gin_tonic = Cocktail.new(name: 'Strong Zero')
gin_tonic.remote_photo_url = ("https://res.cloudinary.com/brykka/image/upload/v1565321032/teadrink_g4or7d.jpg")
gin_tonic.save
Dose.create(cocktail: gin_tonic, ingredient: Ingredient.find_by(name: 'Gin'), description: '1 shot')
Dose.create(cocktail: gin_tonic, ingredient: Ingredient.find_by(name: 'Grape Soda'), description: '3 shots')

moscow_mule = Cocktail.new(name: 'git commit-m "plz work"')
moscow_mule.remote_photo_url = ("https://res.cloudinary.com/brykka/image/upload/v1565321032/watermelon_ewvwck.jpg")
moscow_mule.save
Dose.create(cocktail: moscow_mule, ingredient: Ingredient.find_by(name: 'Vodka'), description: '1 shot')
Dose.create(cocktail: moscow_mule, ingredient: Ingredient.find_by(name: 'Grape Soda'), description: '3 shots')






