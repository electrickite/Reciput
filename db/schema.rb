# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161205025344) do

  create_table "foods", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "food_id"
    t.float    "amount"
    t.string   "unit"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ingredients", ["food_id"], name: "index_ingredients_on_food_id"
  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name",               null: false
    t.text     "description"
    t.integer  "active_time"
    t.integer  "total_time"
    t.string   "yield"
    t.text     "equipment"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "owner_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "recipes", ["active_time"], name: "index_recipes_on_active_time"
  add_index "recipes", ["name"], name: "index_recipes_on_name"
  add_index "recipes", ["owner_id"], name: "index_recipes_on_owner_id"
  add_index "recipes", ["total_time"], name: "index_recipes_on_total_time"

  create_table "recipes_users", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "user_id",   null: false
  end

  create_table "steps", force: :cascade do |t|
    t.integer  "recipe_id"
    t.text     "directions",             null: false
    t.integer  "sequence",   default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "steps", ["recipe_id"], name: "index_steps_on_recipe_id"
  add_index "steps", ["sequence"], name: "index_steps_on_sequence"

  create_table "users", force: :cascade do |t|
    t.string   "username",                       null: false
    t.string   "email",                          null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
