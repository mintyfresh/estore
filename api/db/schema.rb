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

ActiveRecord::Schema[7.0].define(version: 2022_03_04_163002) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "catalog_addons", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.citext "name", null: false
    t.string "description"
    t.integer "extra_price_cents", null: false
    t.string "currency", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["product_id"], name: "index_catalog_addons_on_product_id"
    t.check_constraint "extra_price_cents >= 0"
  end

  create_table "catalog_products", force: :cascade do |t|
    t.bigint "vendor_id", null: false
    t.string "name", null: false
    t.string "description"
    t.integer "price_cents", null: false
    t.string "currency", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["vendor_id"], name: "index_catalog_products_on_vendor_id"
    t.check_constraint "price_cents >= 0"
  end

  create_table "catalog_vendors", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.citext "name", null: false
    t.string "description"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["name"], name: "index_catalog_vendors_on_name", unique: true
    t.index ["owner_id"], name: "index_catalog_vendors_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.citext "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.binary "password_digest", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "catalog_addons", "catalog_products", column: "product_id"
  add_foreign_key "catalog_products", "catalog_vendors", column: "vendor_id"
end
