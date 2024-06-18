# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:

# Diet.create!(name: "Végétarien")
# Target.create!(name: "Perte de poids")
# Avatar.create!(url: "logo.png")
# Restriction.create!(name: "Allergie au gluten")
# Ingredient.create!(name: "Tomate", kcal: 18)
# Preference.create!(like: true, ingredient_id:1)
# RestrictionProfil.create!(restriction_id:1)
# User.create!(email: "test@flavr.com", password: "123456", first_name: "Tom", last_name: "Wagon")
# Profil.create!(user_id: 1, username: "Tom Wagon", sexe: "Masculin", age: 23, diet_id: 1, target_id: 1, avatar_id: 1, restriction_profil_id: 1, preference_id: 1)
# Profil.create!(user_id: 1, username: "Gautier", sexe: "Masculin", age: 16, diet_id: 1, target_id: 1, avatar_id: 1, restriction_profil_id: 1, preference_id: 1)
User.destroy_all
Recipe.destroy_all
User.create!(email: "hello@flavr.com", password: "azerty", first_name: "Constance", last_name: "dbg")

# Recipe.create!(name: "Salade de quinoa et avocat", description: "Une salade rafraîchissante et nutritive avec du quinoa, avocat, et légumes frais.")
Recipe.create!(name:"Poulet grillé au citron et herbes", description:"Poulet tendre et juteux mariné au citron et herbes aromatiques, grillé à la perfection.")
Recipe.create!(name:"Soupe de légumes détox", description:"Un mélange réconfortant de légumes frais pour purifier et revitaliser le corps.")
Recipe.create!(name:"Tacos de poisson à l'avocat", description:"Tacos légers et savoureux avec du poisson grillé et une salsa à l'avocat.")
Recipe.create!(name:"Buddha bowl aux légumes rôtis", description:"Un bol équilibré avec des légumes rôtis, des grains entiers et une sauce crémeuse.")
Recipe.create!(name:"Saumon Rôti et Asperges", description:"Saumon rôti au four avec asperges et citron, simple et délicieux.")
Recipe.create!(name:"Riz de chou-fleur sauté", description:"Une alternative saine au riz, sautée avec des légumes et une touche de sauce soja.")
Recipe.create!(name:"Wraps de laitue au poulet asiatique", description:"Wraps croquants et savoureux avec du poulet mariné et des légumes frais.")
Recipe.create!(name:"Salade de lentilles méditerranéenne", description:"Une salade riche en protéines avec des lentilles, feta, olives, et légumes frais.")
Recipe.create!(name:"Poisson en Papillote", description:"Poisson cuit dans une papillote avec légumes et herbes, tendre et parfumé.")

#   end
