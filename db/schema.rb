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

ActiveRecord::Schema[7.0].define(version: 2023_09_06_091653) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "budget_lists", force: :cascade do |t|
    t.string "name"
    t.float "amount"
    t.string "status"
    t.string "category"
    t.boolean "allow_overspending"
    t.string "frequency"
    t.date "start_date"
    t.date "end_date"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }
    t.index ["user_id"], name: "index_budget_lists_on_user_id"
    t.index ["uuid"], name: "index_budget_lists_on_uuid", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.bigint "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.bigint "subcategory_id", null: false
    t.bigint "restaurant_id", null: false
    t.string "name"
    t.text "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_menu_items_on_category_id"
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id"
    t.index ["subcategory_id"], name: "index_menu_items_on_subcategory_id"
    t.index ["user_id"], name: "index_menu_items_on_user_id"
  end

  create_table "menu_orders", force: :cascade do |t|
    t.bigint "menuItem_id", null: false
    t.bigint "order_id", null: false
    t.integer "quantity"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menuItem_id"], name: "index_menu_orders_on_menuItem_id"
    t.index ["order_id"], name: "index_menu_orders_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "payment_id", null: false
    t.integer "total_amount"
    t.integer "total_quantity"
    t.boolean "fulfilled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.boolean "fulfilled"
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_payments_on_customer_id"
  end

  create_table "restaurant_orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "menuItem_id", null: false
    t.bigint "restaurant_id", null: false
    t.bigint "payment_id", null: false
    t.integer "quantity"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_restaurant_orders_on_customer_id"
    t.index ["menuItem_id"], name: "index_restaurant_orders_on_menuItem_id"
    t.index ["payment_id"], name: "index_restaurant_orders_on_payment_id"
    t.index ["restaurant_id"], name: "index_restaurant_orders_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "category_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
    t.index ["user_id"], name: "index_sub_categories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "jti", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "budget_lists", "users"
  add_foreign_key "categories", "users"
  add_foreign_key "menu_items", "categories"
  add_foreign_key "menu_items", "restaurants"
  add_foreign_key "menu_items", "sub_categories", column: "subcategory_id"
  add_foreign_key "menu_items", "users"
  add_foreign_key "menu_orders", "menu_items", column: "menuItem_id"
  add_foreign_key "menu_orders", "orders"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "payments"
  add_foreign_key "payments", "customers"
  add_foreign_key "restaurant_orders", "customers"
  add_foreign_key "restaurant_orders", "menu_items", column: "menuItem_id"
  add_foreign_key "restaurant_orders", "payments"
  add_foreign_key "restaurant_orders", "restaurants"
  add_foreign_key "restaurants", "users"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "sub_categories", "users"
end
