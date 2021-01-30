# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_29_235317) do

  create_table "books", force: :cascade do |t|
    t.string "game"
    t.string "title"
    t.string "subtitle"
    t.string "type_of"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "career_skills", force: :cascade do |t|
    t.integer "career_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["career_id"], name: "index_career_skills_on_career_id"
    t.index ["skill_id"], name: "index_career_skills_on_skill_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_careers_on_book_id"
  end

  create_table "character_careers", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "career_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["career_id"], name: "index_character_careers_on_career_id"
    t.index ["character_id"], name: "index_character_careers_on_character_id"
  end

  create_table "character_skills", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "skill_id", null: false
    t.boolean "career"
    t.integer "ranks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_skills_on_character_id"
    t.index ["skill_id"], name: "index_character_skills_on_skill_id"
  end

  create_table "character_specializations", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "specialization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_specializations_on_character_id"
    t.index ["specialization_id"], name: "index_character_specializations_on_specialization_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "type_of"
    t.integer "wounds"
    t.integer "strain"
    t.integer "soak"
    t.integer "def_ranged"
    t.integer "def_melee"
    t.integer "brawn"
    t.integer "agility"
    t.integer "intellect"
    t.integer "cunning"
    t.integer "willpower"
    t.integer "presence"
    t.integer "force_rating"
    t.string "species"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "attr"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "specialization_skills", force: :cascade do |t|
    t.integer "specialization_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_specialization_skills_on_skill_id"
    t.index ["specialization_id"], name: "index_specialization_skills_on_specialization_id"
  end

  create_table "specializations", force: :cascade do |t|
    t.integer "book_id", null: false
    t.string "name"
    t.integer "career_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_specializations_on_book_id"
    t.index ["career_id"], name: "index_specializations_on_career_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.integer "credits"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "career_skills", "careers"
  add_foreign_key "career_skills", "skills"
  add_foreign_key "careers", "books"
  add_foreign_key "character_careers", "careers"
  add_foreign_key "character_careers", "characters"
  add_foreign_key "character_skills", "characters"
  add_foreign_key "character_skills", "skills"
  add_foreign_key "character_specializations", "characters"
  add_foreign_key "character_specializations", "specializations"
  add_foreign_key "specialization_skills", "skills"
  add_foreign_key "specialization_skills", "specializations"
  add_foreign_key "specializations", "books"
  add_foreign_key "specializations", "careers"
end
