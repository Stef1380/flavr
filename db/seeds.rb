require 'openai'
require 'cloudinary'
require 'open-uri'
require 'json'

puts "ready"
ActiveRecord::Base.connection.disable_referential_integrity do
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
  Recipe.destroy_all
end

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

 puts "ready to seed ingredients"

  client = OpenAI::Client.new
  30.times do
      ingredients_liste = Ingredient.pluck(:name)
      puts ingredients_liste
      chatgpt_response = client.chat(parameters: {
      model: "gpt-4o",
      messages: [{ role: "user", content: "Génère 1 ingrédients (soit un fruit, une viande, un poisson, une épice.. etc) de recette de cuisine ingredient: 'un ingrédient de recette de cuisine, par exemple tomate, beurre etc' kcal_100g: 'les calories par 100 de l'ingrédient'
        cet ingrédient doit être différent des ingrédient déjà présent dans #{ingredients_liste}
        je veux juste la réponse dans un json, sans introduction ni conclusion" }]
    })

    if chatgpt_response && chatgpt_response["choices"] && chatgpt_response["choices"][0] && chatgpt_response["choices"][0]["message"] && chatgpt_response["choices"][0]["message"]["content"]
      content = chatgpt_response["choices"][0]["message"]["content"]

      # Tentative de trouver un bloc de code JSON
      match_data = content.match(/```json\n(.*?)\n```/m)
      json_string = match_data ? match_data[1] : content

      begin
        ingredient_data = JSON.parse(json_string)
        ingredient_name = ingredient_data["ingredient"]
        kcal_100g = ingredient_data["kcal_100g"].to_i
        created_ingredient = Ingredient.create!(name: ingredient_name, kcal_100g: kcal_100g)
        dalle_response = client.images.generate( parameters: {
          prompt: "une image réaliste jolie et appétissante de #{created_ingredient.name} ",
          size: "1024x1024" }
      )
  image_url = dalle_response["data"][0]["url"]
  created_ingredient.photo.attach(io: URI.open(image_url), filename: created_ingredient.name)
        # Suite du traitement...
      rescue JSON::ParserError => e
        puts "Erreur de parsing JSON : #{e.message}"
      rescue => e
        puts "Erreur : #{e.message}"
      end
    end
  end
 puts "ingredients ok"


# ingredient_1 = Ingredient.create!(name: "Tomate", kcal_100g: 18)
# ingredient_2 = Ingredient.create!(name: "Noux de cajou", kcal_100g: 678)
# ingredient_3 = Ingredient.create!(name: "brocoli", kcal_100g: 18)
# ingredient_4 = Ingredient.create!(name: "couscous", kcal_100g: 678)
# ingredient_5 = Ingredient.create!(name: "buratta", kcal_100g: 18)
# ingredient_6 = Ingredient.create!(name: "patate douce", kcal_100g: 678)
# ingredient_7 = Ingredient.create!(name: "champignon", kcal_100g: 678)
# ingredient_8 = Ingredient.create!(name: "avocat", kcal_100g: 18)
# ingredient_9 = Ingredient.create!(name: "saumon cru", kcal_100g: 678)
# ingredient_10 = Ingredient.create!(name: "raisin", kcal_100g: 678)
# ingredient_11 = Ingredient.create!(name: "roquefort", kcal_100g: 678)
# ingredient_12 = Ingredient.create!(name: "chou", kcal_100g: 18)
# ingredient_13 = Ingredient.create!(name: "endive", kcal_100g: 678)


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

# Preference.create!(like: true, ingredient: ingredient_1, profil: toto)
# Preference.create!(like: true, ingredient: ingredient_2, profil: toto)
# Preference.create!(like: true, ingredient: ingredient_3, profil: toto)
# Preference.create!(like: true, ingredient: ingredient_8, profil: toto)
# Preference.create!(like: true, ingredient: ingredient_9, profil: toto)
# Preference.create!(like: false, ingredient: ingredient_10, profil: toto)
# Preference.create!(like: false, ingredient: ingredient_11, profil: toto)
# Preference.create!(like: false, ingredient: ingredient_12, profil: toto)
# Preference.create!(like: false, ingredient: ingredient_13, profil: toto)


# titi = Profil.create!(user: user_1, username: "Louise", sexe: "Feminin", age: 33, diet: diet_1, target: target_3, avatar: avatar_2)
# RestrictionProfil.create!(restriction: restriction_1, profil: titi)
# Preference.create!(like: true, ingredient: ingredient_4, profil: titi)
# Preference.create!(like: true, ingredient: ingredient_5, profil: titi)
# Preference.create!(like: true, ingredient: ingredient_6, profil: titi)
# Preference.create!(like: true, ingredient: ingredient_7, profil: titi)
# Preference.create!(like: true, ingredient: ingredient_1, profil: titi)
# RestrictionProfil.create!(restriction: restriction_0, profil: titi)
# RestrictionProfil.create!(restriction: restriction_2, profil: titi)




puts "all right"


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
