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

ActiveRecord::Schema[8.1].define(version: 2026_01_01_034739) do
  create_table "customers", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.text "address"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.decimal "cost_price"
    t.datetime "created_at", null: false
    t.string "name"
    t.decimal "selling_price"
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.date "date"
    t.integer "employee_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_purchases_on_employee_id"
    t.index ["product_id"], name: "index_purchases_on_product_id"
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.integer "customer_id", null: false
    t.date "date"
    t.integer "employee_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_sales_on_customer_id"
    t.index ["employee_id"], name: "index_sales_on_employee_id"
    t.index ["product_id"], name: "index_sales_on_product_id"
  end

  add_foreign_key "purchases", "employees"
  add_foreign_key "purchases", "products"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "employees"
  add_foreign_key "sales", "products"
end
