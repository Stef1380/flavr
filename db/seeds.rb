# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
Diet.create!(name: "Végétarien")
Target.create!(name: "Perte de poids")
Avatar.create!(url: "logo.png")
Restriction.create!(name: "Allergie au gluten")
Ingredient.create!(name: "Tomate", kcal: 18)
Preference.create!(like: true, ingredient_id:1)
RestrictionProfil.create!(restriction_id:1)
User.create!(email: "test@flavr.com", password: "123456", first_name: "Tom", last_name: "Wagon")
Profil.create!(user_id: 1, username: "Tom Wagon", sexe: "Masculin", age: 23, diet_id: 1, target_id: 1, avatar_id: 1, restriction_profil_id: 1, preference_id: 1)
Profil.create!(user_id: 1, username: "Gautier", sexe: "Masculin", age: 16, diet_id: 1, target_id: 1, avatar_id: 1, restriction_profil_id: 1, preference_id: 1)
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
