# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_18_095217) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", force: :cascade do |t|
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diets", force: :cascade do |t|
    t.string "diet_label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredient_recipes", force: :cascade do |t|
    t.float "quantity"
    t.bigint "recipe_id"
    t.bigint "ingredient_id"
    t.bigint "profil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredient_recipes_on_ingredient_id"
    t.index ["profil_id"], name: "index_ingredient_recipes_on_profil_id"
    t.index ["recipe_id"], name: "index_ingredient_recipes_on_recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "ingredient_label"
    t.integer "kcal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.boolean "like"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_preferences_on_ingredient_id"
  end

  create_table "profils", force: :cascade do |t|
    t.string "username"
    t.string "sexe"
    t.integer "age"
    t.bigint "user_id"
    t.bigint "diet_id"
    t.bigint "target_id"
    t.bigint "avatar_id"
    t.bigint "restriction_profil_id"
    t.bigint "preference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_profils_on_avatar_id"
    t.index ["diet_id"], name: "index_profils_on_diet_id"
    t.index ["preference_id"], name: "index_profils_on_preference_id"
    t.index ["restriction_profil_id"], name: "index_profils_on_restriction_profil_id"
    t.index ["target_id"], name: "index_profils_on_target_id"
    t.index ["user_id"], name: "index_profils_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "recipe_label"
    t.text "recipe_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restriction_profils", force: :cascade do |t|
    t.bigint "restriction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restriction_id"], name: "index_restriction_profils_on_restriction_id"
  end

  create_table "restrictions", force: :cascade do |t|
    t.string "restriction_label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "targets", force: :cascade do |t|
    t.string "target_label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ingredient_recipes", "ingredients"
  add_foreign_key "ingredient_recipes", "profils"
  add_foreign_key "ingredient_recipes", "recipes"
  add_foreign_key "preferences", "ingredients"
  add_foreign_key "profils", "avatars"
  add_foreign_key "profils", "diets"
  add_foreign_key "profils", "preferences"
  add_foreign_key "profils", "restriction_profils"
  add_foreign_key "profils", "targets"
  add_foreign_key "profils", "users"
  add_foreign_key "restriction_profils", "restrictions"
end
