# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
puts "ready"
Preference.destroy_all
RestrictionProfil.destroy_all
Profil.destroy_all
IngredientRecipe.destroy_all
Ingredient.destroy_all
Diet.destroy_all
Target.destroy_all
Avatar.destroy_all
Restriction.destroy_all
User.destroy_all


puts "setup"

user_1 = User.create!(email: "stef@flavr.com", password: 123456, first_name: "Stef", last_name: "B")
diet_1 = Diet.create!(name: "Végétarien")
diet_2 = Diet.create!(name: "pas de poisson")
diet_3 = Diet.create!(name: "vegane")
target_1 = Target.create!(name: "Perte de poids")
target_2 = Target.create!(name: "Diabet")
restriction_0 = Restriction.create!(name: "Allergie au gluten")
restriction_1 = Restriction.create!(name: "sans gluten")
restriction_2 = Restriction.create!(name: "sans viande")
avatar_1 = Avatar.create!(url: "brocoli.png")
avatar_2 = Avatar.create!(url: "tomate.png")
ingredient_1 = Ingredient.create!(name: "Tomate", kcal: 18)
<<<<<<< HEAD
tom = Profil.create!(user: user_1, username: "Tom Wagon", sexe: "Masculin", age: 23, diet: diet_1, target: target_1, avatar: avatar_1)
gautier = Profil.create!(user: user_1, username: "Gautier", sexe: "Masculin", age: 16, diet: diet_1, target: target_1, avatar: avatar_2)
RestrictionProfil.create!(restriction: restriction_0, profil: tom)
RestrictionProfil.create!(restriction: restriction_2, profil: gautier)
Preference.create!(like: true, ingredient: ingredient_1, profil: tom)
=======

toto = Profil.create!(user: user_1, username: "Tom Wagon", sexe: "Masculin", age: 23, diet: diet_1, target: target_1, avatar: avatar_1)
RestrictionProfil.create!(restriction: restriction_1, profil: toto)
Preference.create!(like: true, ingredient: ingredient_1, profil: toto)

titi = Profil.create!(user: user_1, username: "Gautier", sexe: "Masculin", age: 16, diet: diet_1, target: target_1, avatar: avatar_1)
RestrictionProfil.create!(restriction: restriction_0, profil: titi)
RestrictionProfil.create!(restriction: restriction_2, profil: titi)
Preference.create!(like: true, ingredient: ingredient_1, profil: titi)
>>>>>>> 67fbb17d01aae57d0076c861e7abab2fa595f5ea

puts "Go"



Recipe.create!(name:"Salade de quinoa et avocat", description:"Une salade rafraîchissante et nutritive avec du quinoa, avocat, et légumes frais.")
Recipe.create!(name:"Poulet grillé au citron et herbes", description:"Poulet tendre et juteux mariné au citron et herbes aromatiques, grillé à la perfection.")
Recipe.create!(name:"Soupe de légumes détox", description:"Un mélange réconfortant de légumes frais pour purifier et revitaliser le corps.")
Recipe.create!(name:"Tacos de poisson à l'avocat", description:"Tacos légers et savoureux avec du poisson grillé et une salsa à l'avocat.")
Recipe.create!(name:"Buddha bowl aux légumes rôtis", description:"Un bol équilibré avec des légumes rôtis, des grains entiers et une sauce crémeuse.")
Recipe.create!(name:"Saumon Rôti et Asperges", description:"Saumon rôti au four avec asperges et citron, simple et délicieux.")
Recipe.create!(name:"Riz de chou-fleur sauté", description:"Une alternative saine au riz, sautée avec des légumes et une touche de sauce soja.")
Recipe.create!(name:"Wraps de laitue au poulet asiatique", description:"Wraps croquants et savoureux avec du poulet mariné et des légumes frais.")
Recipe.create!(name:"Salade de lentilles méditerranéenne", description:"Une salade riche en protéines avec des lentilles, feta, olives, et légumes frais.")
Recipe.create!(name:"Poisson en Papillote", description:"Poisson cuit dans une papillote avec légumes et herbes, tendre et parfumé.")
# IngredientRecipe.create!(quantity: "3", recipe_id: 1, ingredient_id: 1)
#   end
