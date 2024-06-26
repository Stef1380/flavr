class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :profils, dependent: :destroy
  has_many :user_recipes
  has_many :recipes, through: :user_recipes

# je connecte avec l'API openAI
# pour le current_user !!!!
# les recettes sont stockées pour tout les utilisateurs avec un système de notation pour ne proposer que les meilleures

# je dois récupérer les restrictions, le profil santé? de l'utilisateur, les préférences et le régime alimentaire. (carence?)
# je fais le promt pour une recette du jour
# prompt avec interpolation (En français)
# Nombre d'étapes / plating.

# le recette et les ingrédients sont stockées et j'ajuste les proportions pour chaque profil
# al

# je récupère la date du jour


end
