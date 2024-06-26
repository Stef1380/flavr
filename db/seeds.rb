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
diet_4 = Diet.create!(name: "Flexi")
diet_5 = Diet.create!(name: "Végétarien.ne")
diet_6 = Diet.create!(name: "Pescetarien.ne")
diet_7 = Diet.create!(name: "Vegan")
Diet.create!(name: "Flexitarien.ne")
Diet.create!(name: "Pas de régime en particulier")


target_1 = Target.create!(name: "Perte de poids")
target_2 = Target.create!(name: "Diabet")
target_3 = Target.create!(name: "stable")
Target.create!(name: "Prise de masse musculaire")
Target.create!(name: "Maintenance du poids")



restriction_0 = Restriction.create!(name: "Allergie au gluten")
restriction_1 = Restriction.create!(name: "sans gluten")
restriction_2 = Restriction.create!(name: "sans viande")
restriction_3 = Restriction.create!(name: "sans lactose")



avatar_1 = Avatar.create!(url: "brocoli.png")
avatar_2 = Avatar.create!(url: "tomate.png")
avatar_1 = Avatar.create!(url: "brocoli.png")
avatar_2 = Avatar.create!(url: "tomate.png")
avatar_3 = Avatar.create!(url: "tomate.png")
avatar_4 = Avatar.create!(url: "tomate.png")
avatar_5 = Avatar.create!(url: "tomate.png")


ingredient_1 = Ingredient.create!(name: "Tomate", kcal_100g: 18)
ingredient_2 = Ingredient.create!(name: "Noux de cajou", kcal_100g: 678)
ingredient_3 = Ingredient.create!(name: "brocoli", kcal_100g: 18)
ingredient_4 = Ingredient.create!(name: "couscous", kcal_100g: 678)
ingredient_5 = Ingredient.create!(name: "buratta", kcal_100g: 18)
ingredient_6 = Ingredient.create!(name: "patate douce", kcal_100g: 678)
ingredient_7 = Ingredient.create!(name: "champignon", kcal_100g: 678)
ingredient_8 = Ingredient.create!(name: "avocat", kcal_100g: 18)
ingredient_9 = Ingredient.create!(name: "saumon cru", kcal_100g: 678)
ingredient_10 = Ingredient.create!(name: "raisin", kcal_100g: 678)
ingredient_11 = Ingredient.create!(name: "roquefort", kcal_100g: 678)
ingredient_12 = Ingredient.create!(name: "chou", kcal_100g: 18)
ingredient_13 = Ingredient.create!(name: "endive", kcal_100g: 678)


restriction_0 = Restriction.create!(name: "Intolérance au gluten")
restriction_1 = Restriction.create!(name: "Intolérance au lactose")
restriction_2 = Restriction.create!(name: "Allergie aux fruits de mer")
Restriction.create!(name: "Allergie aux arachides")
Restriction.create!(name: "Allergie aux noix")
Restriction.create!(name: "Allergie aux oeufs")
Restriction.create!(name: "Allergie au blé")
Restriction.create!(name: "Allergie au soja")




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



titi = Profil.create!(user: user_1, username: "Louise", sexe: "Feminin", age: 33, diet: diet_1, target: target_3, avatar: avatar_2)
RestrictionProfil.create!(restriction: restriction_1, profil: titi)
Preference.create!(like: true, ingredient: ingredient_4, profil: titi)
Preference.create!(like: true, ingredient: ingredient_5, profil: titi)
Preference.create!(like: true, ingredient: ingredient_6, profil: titi)
Preference.create!(like: true, ingredient: ingredient_7, profil: titi)
Preference.create!(like: true, ingredient: ingredient_1, profil: titi)
RestrictionProfil.create!(restriction: restriction_0, profil: titi)
RestrictionProfil.create!(restriction: restriction_2, profil: titi)


tata = Profil.create!(user: user_1, username: "Amine", sexe: "Masculin", age: 18, diet: diet_1, target: target_1, avatar: avatar_3)
RestrictionProfil.create!(restriction: restriction_0, profil: tata)
RestrictionProfil.create!(restriction: restriction_2, profil: tata)
Preference.create!(like: true, ingredient: ingredient_1, profil: tata)

toutou = Profil.create!(user: user_1, username: "Amine", sexe: "Masculin", age: 18, diet: diet_1, target: target_1, avatar: avatar_4)
RestrictionProfil.create!(restriction: restriction_0, profil: toutou)
RestrictionProfil.create!(restriction: restriction_2, profil: toutou)
Preference.create!(like: true, ingredient: ingredient_1, profil: toutou)

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

# client = OpenAI::Client.new
# chatgpt_response = client.chat(
#   parameters: {
#     model: "gpt-4o",
#     messages: [
#       {
#         role: "user",
#         content: "donne moi dans un hash de 5 ingredients:
#         name: 'un ingrédient pour cuisiner',
#         kcal_100g: 'les calories par 100g'
#         url: 'une image de l'ingrédient
#         je veux juste le json sans introduction ou conclusion"
#       }
#     ]
#   }
# )

# ingredient_data = JSON.parse(chatgpt_response["choices"][0]["message"]["content"])
# ingredient_data.each do |ingredient|
#   ingredient_name = ingredient["ingredient"]
#   dalle_response = client.image.create(
#     parameters: {
#       prompt: "A realistic image of #{ingredient_name}",
#       size: "1024x1024"
#     }
#   )
#   ingredient["image"] = dalle_response["data"][0]["url"]
#   uploaded_image = Cloudinary::Uploader.upload(image_url, public_id: ingredient_name)

#   ingredient["image"] = uploaded_image["secure_url"]
# end
