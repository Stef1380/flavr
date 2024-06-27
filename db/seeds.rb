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
diet_2 = Diet.create!(name: "Pas de poisson")
diet_3 = Diet.create!(name: "Vegane")
diet_4 = Diet.create!(name: "Flexitarien.ne")
diet_5 = Diet.create!(name: "Végétarien.ne")
diet_6 = Diet.create!(name: "Pescétarien.ne")
diet_7 = Diet.create!(name: "Pas de régime en particulier")
diet_8 = Diet.create!(name: "Paléo")


target_1 = Target.create!(name: "Perte de poids")
target_2 = Target.create!(name: "Prise de masse musculaire")
target_3 = Target.create!(name: "Maintenance du poids")
target_4 = Target.create!(name: "Amélioration de la santé digestive")
target_5 = Target.create!(name: "Renforcement du système immunitaire")
target_5 = Target.create!(name: "Amélioration de la santé de la peau")
target_7 = Target.create!(name: "Augmentation de l'énergie")
target_8 = Target.create!(name: "Contrôle de la glycémie")
target_8 = Target.create!(name: "Soutien de la santé des os")


# restriction_0 = Restriction.create!(name: "Allergie au gluten")
# restriction_1 = Restriction.create!(name: "Sans gluten")
# restriction_2 = Restriction.create!(name: "Sans viande")
# restriction_3 = Restriction.create!(name: "Sans lactose")



  avatar_1 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/poivre_pfeam0.jpg")
  avatar_2 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/brocoli_fspmtc.jpg")
  avatar_3 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/citrouille_ji012l.jpg")
  avatar_4 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/celeri_afqzqz.jpg")
  avatar_5 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/fraise_vwhnyt.jpg")
  avatar_6 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/concombre_jh52ay.jpg")
  avatar_7 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/fruit_xsnzit.jpg")
  avatar_8 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/pasteque_wjmgpb.jpg")
  avatar_9 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/papaye_wcaypm.jpg")
  avatar_10 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/orange_vkeoal.jpg")
  avatar_11 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/pois_yexg5i.jpg")
  avatar_12 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/poire_oi5hfz.jpg")
  avatar_13 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/pomme_w17okg.jpg")
  avatar_15 = Avatar.create!(url: "https://res.cloudinary.com/dxm2sdqhi/image/upload/v1234567890/tomate_k5mot3.jpg")



ingredient_1 = Ingredient.create!(name: "Tomate", kcal_100g: 20)
ingredient_2 = Ingredient.create!(name: "Noux de cajou", kcal_100g: 624)
ingredient_3 = Ingredient.create!(name: "Brocoli", kcal_100g: 34)
ingredient_4 = Ingredient.create!(name: "Couscous", kcal_100g: 112)
ingredient_5 = Ingredient.create!(name: "Buratta", kcal_100g: 350)
ingredient_6 = Ingredient.create!(name: "Patate douce", kcal_100g: 86)
ingredient_7 = Ingredient.create!(name: "Champignon", kcal_100g: 22)
ingredient_8 = Ingredient.create!(name: "Avocat", kcal_100g: 160)
ingredient_9 = Ingredient.create!(name: "Saumon cru", kcal_100g: 127)
ingredient_10 = Ingredient.create!(name: "Raisin", kcal_100g: 69)
ingredient_11 = Ingredient.create!(name: "Roquefort", kcal_100g: 374)
ingredient_12 = Ingredient.create!(name: "Chou", kcal_100g: 24)
ingredient_13 = Ingredient.create!(name: "Endive", kcal_100g: 17)


restriction_0 = Restriction.create!(name: "Intolérance au gluten")
restriction_1 = Restriction.create!(name: "Intolérance au lactose")
restriction_2 = Restriction.create!(name: "Allergie aux fruits de mer")
restriction_3 = Restriction.create!(name: "Allergie aux arachides")
restriction_4 = Restriction.create!(name: "Allergie aux noix")
restriction_5 = Restriction.create!(name: "Allergie aux oeufs")
restriction_6 = Restriction.create!(name: "Allergie au blé")
restriction_7 = Restriction.create!(name: "Allergie au soja")


toto = Profil.create!(user: user_1, username: "Stef", sexe: "Masculin", age: 44, diet: diet_4, target: target_1, avatar: avatar_1)
RestrictionProfil.create!(restriction: restriction_3, profil: toto)

Preference.create!(like: true, ingredient: ingredient_1, profil: toto)
Preference.create!(like: true, ingredient: ingredient_2, profil: toto)
Preference.create!(like: true, ingredient: ingredient_3, profil: toto)
Preference.create!(like: true, ingredient: ingredient_8, profil: toto)
Preference.create!(like: true, ingredient: ingredient_9, profil: toto)
Preference.create!(like: false, ingredient: ingredient_10, profil: toto)
Preference.create!(like: false, ingredient: ingredient_11, profil: toto)
Preference.create!(like: false, ingredient: ingredient_12, profil: toto)
Preference.create!(like: false, ingredient: ingredient_13, profil: toto)


# titi = Profil.create!(user: user_1, username: "Louise", sexe: "Feminin", age: 33, diet: diet_1, target: target_3, avatar: avatar_2)
# RestrictionProfil.create!(restriction: restriction_1, profil: titi)
# Preference.create!(like: true, ingredient: ingredient_4, profil: titi)
# Preference.create!(like: true, ingredient: ingredient_5, profil: titi)
# Preference.create!(like: true, ingredient: ingredient_6, profil: titi)
# Preference.create!(like: true, ingredient: ingredient_7, profil: titi)
# Preference.create!(like: true, ingredient: ingredient_1, profil: titi)
# RestrictionProfil.create!(restriction: restriction_0, profil: titi)
# RestrictionProfil.create!(restriction: restriction_2, profil: titi)


# tata = Profil.create!(user: user_1, username: "Amine", sexe: "Masculin", age: 18, diet: diet_1, target: target_1, avatar: avatar_3)
# RestrictionProfil.create!(restriction: restriction_0, profil: tata)
# RestrictionProfil.create!(restriction: restriction_2, profil: tata)
# Preference.create!(like: true, ingredient: ingredient_1, profil: tata)


# toutou = Profil.create!(user: user_1, username: "Amine", sexe: "Masculin", age: 18, diet: diet_1, target: target_1, avatar: avatar_4)
# RestrictionProfil.create!(restriction: restriction_0, profil: toutou)
# RestrictionProfil.create!(restriction: restriction_2, profil: toutou)
# Preference.create!(like: true, ingredient: ingredient_1, profil: toutou)

puts "Go"

# Recipe.create!(name:"Salade de quinoa et avocat", description:"Une salade rafraîchissante et nutritive avec du quinoa, avocat, et légumes frais.")
# Recipe.create!(name:"Poulet grillé au citron et herbes", description:"Poulet tendre et juteux mariné au citron et herbes aromatiques, grillé à la perfection.")
# Recipe.create!(name:"Soupe de légumes détox", description:"Un mélange réconfortant de légumes frais pour purifier et revitaliser le corps.")
# Recipe.create!(name:"Tacos de poisson à l'avocat", description:"Tacos légers et savoureux avec du poisson grillé et une salsa à l'avocat.")
# Recipe.create!(name:"Buddha bowl aux légumes rôtis", description:"Un bol équilibré avec des légumes rôtis, des grains entiers et une sauce crémeuse.")
# Recipe.create!(name:"Saumon Rôti et Asperges", description:"Saumon rôti au four avec asperges et citron, simple et délicieux.")
# Recipe.create!(name:"Riz de chou-fleur sauté", description:"Une alternative saine au riz, sautée avec des légumes et une touche de sauce soja.")
# Recipe.create!(name:"Wraps de laitue au poulet asiatique", description:"Wraps croquants et savoureux avec du poulet mariné et des légumes frais.")
# Recipe.create!(name:"Salade de lentilles méditerranéenne", description:"Une salade riche en protéines avec des lentilles, feta, olives, et légumes frais.")
# Recipe.create!(name:"Poisson en Papillote", description:"Poisson cuit dans une papillote avec légumes et herbes, tendre et parfumé.")
# # IngredientRecipe.create!(quantity: "3", recipe_id: 1, ingredient_id: 1)
#   end
