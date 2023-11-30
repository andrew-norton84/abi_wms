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

ActiveRecord::Schema[7.1].define(version: 2023_11_28_230719) do
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

  create_table "containers", force: :cascade do |t|
    t.integer "warehouse_division_id", null: false
    t.integer "location_type_id", null: false
    t.integer "warehouse_location_id", null: false
    t.integer "storage_location_id", null: false
    t.integer "stock_type_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.date "expiry_date"
    t.date "manufact_date"
    t.string "batch_number"
    t.string "reference"
    t.string "notes"
    t.string "special_stock_type"
    t.string "special_text"
    t.string "sub_location"
    t.integer "secondary_status"
    t.string "serial_number"
    t.string "last_updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_type_id"], name: "index_containers_on_location_type_id"
    t.index ["product_id"], name: "index_containers_on_product_id"
    t.index ["stock_type_id"], name: "index_containers_on_stock_type_id"
    t.index ["storage_location_id"], name: "index_containers_on_storage_location_id"
    t.index ["warehouse_division_id", "location_type_id", "warehouse_location_id"], name: "idx_on_warehouse_division_id_location_type_id_wareh_d68492e79d"
    t.index ["warehouse_division_id"], name: "index_containers_on_warehouse_division_id"
    t.index ["warehouse_location_id"], name: "index_containers_on_warehouse_location_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer"
    t.integer "country_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_customers_on_country_id"
    t.index ["customer"], name: "index_customers_on_customer", unique: true
  end

  create_table "location_properties", force: :cascade do |t|
    t.string "property_group"
    t.string "description"
    t.integer "loc_height"
    t.integer "loc_width"
    t.integer "loc_depth"
    t.integer "no_of_skus"
    t.integer "no_of_batches"
    t.integer "storage_location_id", null: false
    t.integer "stock_type_id", null: false
    t.integer "product_type_id", null: false
    t.string "replen_zone"
    t.string "count_zone"
    t.boolean "exist_empty"
    t.boolean "create_on_fly"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type_id"], name: "index_location_properties_on_product_type_id"
    t.index ["property_group"], name: "index_location_properties_on_property_group", unique: true
    t.index ["stock_type_id"], name: "index_location_properties_on_stock_type_id"
    t.index ["storage_location_id"], name: "index_location_properties_on_storage_location_id"
  end

  create_table "location_types", force: :cascade do |t|
    t.string "location_type"
    t.string "short_desc"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_type"], name: "index_location_types_on_location_type", unique: true
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "product_type"
    t.string "short_desc"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type"], name: "index_product_types_on_product_type", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "product"
    t.integer "country_id", null: false
    t.integer "product_type_id", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_products_on_country_id"
    t.index ["product"], name: "index_products_on_product", unique: true
    t.index ["product_type_id"], name: "index_products_on_product_type_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "stock_types", force: :cascade do |t|
    t.string "stock_type"
    t.string "short_desc"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_type"], name: "index_stock_types_on_stock_type", unique: true
  end

  create_table "storage_locations", force: :cascade do |t|
    t.integer "storage_location"
    t.string "short_desc"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["storage_location"], name: "index_storage_locations_on_storage_location", unique: true
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "supplier"
    t.integer "country_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_suppliers_on_country_id"
    t.index ["supplier"], name: "index_suppliers_on_supplier", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "warehouse_divisions", force: :cascade do |t|
    t.string "division"
    t.string "description"
    t.integer "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_warehouse_divisions_on_country_id"
    t.index ["division"], name: "index_warehouse_divisions_on_division", unique: true
  end

  create_table "warehouse_locations", force: :cascade do |t|
    t.integer "warehouse_division_id", null: false
    t.integer "location_type_id", null: false
    t.string "location"
    t.integer "storage_location_id", null: false
    t.integer "stock_type_id", null: false
    t.integer "location_property_id", null: false
    t.string "special_stock_type"
    t.string "special_text"
    t.string "drop_zone"
    t.string "loc_status"
    t.decimal "latitude", precision: 6, scale: 5
    t.decimal "longitude", precision: 6, scale: 5
    t.string "last_updated_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_property_id"], name: "index_warehouse_locations_on_location_property_id"
    t.index ["location_type_id"], name: "index_warehouse_locations_on_location_type_id"
    t.index ["stock_type_id"], name: "index_warehouse_locations_on_stock_type_id"
    t.index ["storage_location_id"], name: "index_warehouse_locations_on_storage_location_id"
    t.index ["warehouse_division_id", "location_type_id", "location"], name: "idx_on_warehouse_division_id_location_type_id_locat_3a6a4b7fa6", unique: true
    t.index ["warehouse_division_id"], name: "index_warehouse_locations_on_warehouse_division_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "containers", "location_types"
  add_foreign_key "containers", "products"
  add_foreign_key "containers", "stock_types"
  add_foreign_key "containers", "storage_locations"
  add_foreign_key "containers", "warehouse_divisions"
  add_foreign_key "containers", "warehouse_locations"
  add_foreign_key "customers", "countries"
  add_foreign_key "location_properties", "product_types"
  add_foreign_key "location_properties", "stock_types"
  add_foreign_key "location_properties", "storage_locations"
  add_foreign_key "microposts", "users"
  add_foreign_key "products", "countries"
  add_foreign_key "products", "product_types"
  add_foreign_key "suppliers", "countries"
  add_foreign_key "warehouse_divisions", "countries"
  add_foreign_key "warehouse_locations", "location_properties"
  add_foreign_key "warehouse_locations", "location_types"
  add_foreign_key "warehouse_locations", "stock_types"
  add_foreign_key "warehouse_locations", "storage_locations"
  add_foreign_key "warehouse_locations", "warehouse_divisions"
end
