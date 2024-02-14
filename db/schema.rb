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

ActiveRecord::Schema[7.1].define(version: 2024_02_14_224228) do
  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemon_abilities", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "ability_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability_id"], name: "index_pokemon_abilities_on_ability_id"
    t.index ["pokemon_id"], name: "index_pokemon_abilities_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "types"
    t.integer "pokedex_entry"
    t.integer "region_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_pokemons_on_region_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.integer "generation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["generation_id"], name: "index_regions_on_generation_id"
  end

  add_foreign_key "pokemon_abilities", "abilities"
  add_foreign_key "pokemon_abilities", "pokemons"
  add_foreign_key "pokemons", "regions"
  add_foreign_key "regions", "generations"
end