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

ActiveRecord::Schema[7.0].define(version: 2022_03_06_013759) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "catalog_addons", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.citext "name", null: false
    t.string "description"
    t.integer "extra_price_cents", null: false
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
    t.boolean "active", default: false, null: false
    t.index ["vendor_id"], name: "index_catalog_products_on_vendor_id"
    t.check_constraint "price_cents >= 0"
  end

  create_table "catalog_vendors", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.citext "name", null: false
    t.string "description"
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.boolean "active", default: false, null: false
    t.index ["name"], name: "index_catalog_vendors_on_name", unique: true
    t.index ["owner_id"], name: "index_catalog_vendors_on_owner_id"
  end

  create_table "mock_users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
  end

  create_table "ordering_cart_items", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "product_id", null: false
    t.string "name", null: false
    t.string "description"
    t.integer "price_cents", null: false
    t.string "currency", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["cart_id", "product_id"], name: "index_ordering_cart_items_on_cart_id_and_product_id", unique: true
    t.index ["cart_id"], name: "index_ordering_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_ordering_cart_items_on_product_id"
    t.check_constraint "price_cents >= 0"
    t.check_constraint "quantity > 0"
  end

  create_table "ordering_carts", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["customer_id"], name: "index_ordering_carts_on_customer_id"
  end

  create_table "ordering_customers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "first_ordered_at", precision: nil
    t.datetime "last_ordered_at", precision: nil
    t.integer "orders_count", default: 0, null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["user_id"], name: "index_ordering_customers_on_user_id", unique: true
  end

  create_table "ordering_order_items", force: :cascade do |t|
    t.bigint "purchase_order_id", null: false
    t.bigint "product_id", null: false
    t.string "name", null: false
    t.string "description"
    t.integer "price_cents", null: false
    t.string "currency", null: false
    t.integer "quantity", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["product_id"], name: "index_ordering_order_items_on_product_id"
    t.index ["purchase_order_id", "product_id"], name: "index_ordering_order_items_on_purchase_order_id_and_product_id", unique: true
    t.index ["purchase_order_id"], name: "index_ordering_order_items_on_purchase_order_id"
    t.check_constraint "price_cents >= 0"
    t.check_constraint "quantity > 0"
  end

  create_table "ordering_purchase_orders", force: :cascade do |t|
    t.bigint "sales_order_id", null: false
    t.bigint "vendor_id", null: false
    t.string "status", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["sales_order_id", "vendor_id"], name: "index_ordering_purchase_orders_on_sales_order_id_and_vendor_id", unique: true
    t.index ["sales_order_id"], name: "index_ordering_purchase_orders_on_sales_order_id"
    t.index ["vendor_id"], name: "index_ordering_purchase_orders_on_vendor_id"
  end

  create_table "ordering_sales_orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "status", null: false
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.datetime "updated_at", default: -> { "now()" }, null: false
    t.index ["customer_id"], name: "index_ordering_sales_orders_on_customer_id"
  end

  add_foreign_key "catalog_addons", "catalog_products", column: "product_id"
  add_foreign_key "catalog_products", "catalog_vendors", column: "vendor_id"
  add_foreign_key "ordering_cart_items", "catalog_products", column: "product_id"
  add_foreign_key "ordering_cart_items", "ordering_carts", column: "cart_id"
  add_foreign_key "ordering_carts", "ordering_customers", column: "customer_id"
  add_foreign_key "ordering_customers", "mock_users", column: "user_id"
  add_foreign_key "ordering_order_items", "catalog_products", column: "product_id"
  add_foreign_key "ordering_order_items", "ordering_purchase_orders", column: "purchase_order_id"
  add_foreign_key "ordering_purchase_orders", "catalog_vendors", column: "vendor_id"
  add_foreign_key "ordering_purchase_orders", "ordering_sales_orders", column: "sales_order_id"
  add_foreign_key "ordering_sales_orders", "ordering_customers", column: "customer_id"
end
