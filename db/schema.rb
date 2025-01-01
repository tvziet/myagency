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

ActiveRecord::Schema[7.2].define(version: 2025_01_01_174356) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "my_agency_infos", force: :cascade do |t|
    t.string "email"
    t.string "address"
    t.string "english_address"
    t.string "phone_number"
    t.string "facebook_name"
    t.string "facebook_link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.string "english_name"
    t.string "slug"
    t.string "english_slug"
    t.integer "position", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["english_name"], name: "index_pages_on_english_name", unique: true
    t.index ["english_slug"], name: "index_pages_on_english_slug", unique: true
    t.index ["name"], name: "index_pages_on_name", unique: true
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end
end
