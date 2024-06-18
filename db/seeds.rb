# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:


Diet.create!(diet_label:"Végétarien")

Target.create!(target_label:"Perte de poids")

Avatar.create!(avatar_url: "logo.png")

Restriction.create!(restriction_label:"Allergie au gluten")

Ingredient.create!(ingredient_label:"Tomate", kcal:18)

Preference.create!(like:true, ingredient_id:1)

RestrictionProfil.create!(restriction_id:1)

User.create!(email:"tessst@flavr.com", password:"123456", first_name:"Tom", last_name:"Wagon")

Profil.create!(user_id:1, username:"Tom Wagon", sexe:"Masculin", age:23, diet_id:1, target_id:1, avatar_id:1, restriction_profil_id:1, preference_id:1)
Profil.create!(user_id:1, username:"Gautier", sexe:"Masculin", age:16, diet_id:1, target_id:1, avatar_id:1, restriction_profil_id:1, preference_id:1)

Recipe.create!(recipe_label:"Salade de quinoa et avocat", description:"Une salade rafraîchissante et nutritive avec du quinoa, avocat, et légumes frais.")
Recipe.create!(recipe_label:"Poulet grillé au citron et herbes", description:"Poulet tendre et juteux mariné au citron et herbes aromatiques, grillé à la perfection.")
Recipe.create!(recipe_label:"Soupe de légumes détox", description:"Un mélange réconfortant de légumes frais pour purifier et revitaliser le corps.")
Recipe.create!(recipe_label:"Tacos de poisson à l'avocat", description:"Tacos légers et savoureux avec du poisson grillé et une salsa à l'avocat.")
Recipe.create!(recipe_label:"Buddha bowl aux légumes rôtis", description:"Un bol équilibré avec des légumes rôtis, des grains entiers et une sauce crémeuse.")
Recipe.create!(recipe_label:"Saumon Rôti et Asperges", description:"Saumon rôti au four avec asperges et citron, simple et délicieux.")
Recipe.create!(recipe_label:"Riz de chou-fleur sauté", description:"Une alternative saine au riz, sautée avec des légumes et une touche de sauce soja.")
Recipe.create!(recipe_label:"Wraps de laitue au poulet asiatique", description:"Wraps croquants et savoureux avec du poulet mariné et des légumes frais.")
Recipe.create!(recipe_label:"Salade de lentilles méditerranéenne", description:"Une salade riche en protéines avec des lentilles, feta, olives, et légumes frais.")
Recipe.create!(recipe_label:"Poisson en Papillote", description:"Poisson cuit dans une papillote avec légumes et herbes, tendre et parfumé.")

#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
