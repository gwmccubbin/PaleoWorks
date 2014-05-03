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

ActiveRecord::Schema.define(version: 20140424202022) do

  create_table "addresses", force: true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state",       default: "TN"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "location_id"
  end

  create_table "away_dates", force: true do |t|
    t.datetime "leave_date"
    t.datetime "return_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_away_dates", force: true do |t|
    t.integer  "customer_id"
    t.integer  "away_date_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_locations", force: true do |t|
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  create_table "customer_recurring_orders", force: true do |t|
    t.integer  "customer_id"
    t.integer  "recurring_order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "delivery",   default: false
    t.string   "phone"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

  create_table "menu_items", force: true do |t|
    t.string   "name"
    t.string   "meal_type"
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recurring_order_menu_items", force: true do |t|
    t.integer  "recurring_order_id"
    t.integer  "menu_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recurring_orders", force: true do |t|
    t.integer  "breakfast_qty",       default: 0
    t.integer  "breakfast_lunch_qty", default: 0
    t.integer  "lunch_qty",           default: 0
    t.integer  "lunch_dinner_qty",    default: 0
    t.integer  "dinner_qty",          default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "muffins_qty"
    t.integer  "all_meals_qty"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end