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

ActiveRecord::Schema.define(version: 2021_08_06_211733) do

  create_table "books", force: :cascade do |t|
    t.string "game"
    t.string "title"
    t.string "subtitle"
    t.string "type_of"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "career_skills", force: :cascade do |t|
    t.bigint "career_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["career_id"], name: "index_career_skills_on_career_id"
    t.index ["skill_id"], name: "index_career_skills_on_skill_id"
  end

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_careers_on_book_id"
  end

  create_table "character_careers", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "career_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["career_id"], name: "index_character_careers_on_career_id"
    t.index ["character_id"], name: "index_character_careers_on_character_id"
  end

  create_table "character_force_power_upgrades", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "force_power_upgrade_id", null: false
    t.boolean "purchased"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_force_power_upgrades_on_character_id"
    t.index ["force_power_upgrade_id"], name: "index_character_force_power_upgrades_on_force_power_upgrade_id"
  end

  create_table "character_force_powers", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "force_power_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_force_powers_on_character_id"
    t.index ["force_power_id"], name: "index_character_force_powers_on_force_power_id"
  end

  create_table "character_skills", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "skill_id", null: false
    t.boolean "career"
    t.integer "ranks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_skills_on_character_id"
    t.index ["skill_id"], name: "index_character_skills_on_skill_id"
  end

  create_table "character_spec_talents", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "specialization_talent_id", null: false
    t.boolean "purchased"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_spec_talents_on_character_id"
    t.index ["specialization_talent_id"], name: "index_character_spec_talents_on_specialization_talent_id"
  end

  create_table "character_specializations", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "specialization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_specializations_on_character_id"
    t.index ["specialization_id"], name: "index_character_specializations_on_specialization_id"
  end

  create_table "character_talents", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "talent_id", null: false
    t.boolean "purchased"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_talents_on_character_id"
    t.index ["talent_id"], name: "index_character_talents_on_talent_id"
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

  create_table "force_power_upgrades", force: :cascade do |t|
    t.integer "force_power_id", null: false
    t.string "name"
    t.integer "row"
    t.integer "colStart"
    t.integer "colSpan"
    t.boolean "upLink1"
    t.boolean "upLink2"
    t.boolean "upLink3"
    t.boolean "upLink4"
    t.boolean "downLink1"
    t.boolean "downLink2"
    t.boolean "downLink3"
    t.boolean "downLink4"
    t.boolean "leftLink"
    t.boolean "rightLink"
    t.integer "cost"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["force_power_id"], name: "index_force_power_upgrades_on_force_power_id"
  end

  create_table "force_powers", force: :cascade do |t|
    t.integer "book_id", null: false
    t.string "name"
    t.boolean "downLink1"
    t.boolean "downLink2"
    t.boolean "downLink3"
    t.boolean "downLink4"
    t.integer "force_rating"
    t.integer "cost"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_force_powers_on_book_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "attr"
    t.text "description"
    t.string "type_of"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "specialization_skills", force: :cascade do |t|
    t.bigint "specialization_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skill_id"], name: "index_specialization_skills_on_skill_id"
    t.index ["specialization_id"], name: "index_specialization_skills_on_specialization_id"
  end

  create_table "specialization_talents", force: :cascade do |t|
    t.bigint "specialization_id", null: false
    t.bigint "talent_id", null: false
    t.integer "row"
    t.integer "colStart"
    t.integer "colSpan"
    t.boolean "upLink"
    t.boolean "downLink"
    t.boolean "leftLink"
    t.boolean "rightLink"
    t.integer "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["specialization_id"], name: "index_specialization_talents_on_specialization_id"
    t.index ["talent_id"], name: "index_specialization_talents_on_talent_id"
  end

  create_table "specializations", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.string "name"
    t.bigint "career_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_specializations_on_book_id"
    t.index ["career_id"], name: "index_specializations_on_career_id"
  end

  create_table "talents", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.string "name"
    t.boolean "active"
    t.string "activation_type"
    t.text "shortDesc"
    t.text "longDesc"
    t.boolean "force"
    t.boolean "ranked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_talents_on_book_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.string "username"
    t.integer "credits"
    t.boolean "first_login", default: true
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "career_skills", "careers"
  add_foreign_key "career_skills", "skills"
  add_foreign_key "careers", "books"
  add_foreign_key "character_careers", "careers"
  add_foreign_key "character_careers", "characters"
  add_foreign_key "character_force_power_upgrades", "characters"
  add_foreign_key "character_force_power_upgrades", "force_power_upgrades"
  add_foreign_key "character_force_powers", "characters"
  add_foreign_key "character_force_powers", "force_powers"
  add_foreign_key "character_skills", "characters"
  add_foreign_key "character_skills", "skills"
  add_foreign_key "character_spec_talents", "characters"
  add_foreign_key "character_spec_talents", "specialization_talents"
  add_foreign_key "character_specializations", "characters"
  add_foreign_key "character_specializations", "specializations"
  add_foreign_key "character_talents", "characters"
  add_foreign_key "character_talents", "talents"
  add_foreign_key "force_power_upgrades", "force_powers"
  add_foreign_key "force_powers", "books"
  add_foreign_key "specialization_skills", "skills"
  add_foreign_key "specialization_skills", "specializations"
  add_foreign_key "specialization_talents", "specializations"
  add_foreign_key "specialization_talents", "talents"
  add_foreign_key "specializations", "books"
  add_foreign_key "specializations", "careers"
  add_foreign_key "talents", "books"
end
