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

ActiveRecord::Schema.define(version: 20160123001342) do

  create_table "expenses", force: :cascade do |t|
    t.integer  "invoice_id"
    t.integer  "matter_id"
    t.string   "desc"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "expenses", ["invoice_id"], name: "index_expenses_on_invoice_id"
  add_index "expenses", ["matter_id"], name: "index_expenses_on_matter_id"

  create_table "invoices", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "invoice_id"
    t.integer  "matter_id"
    t.date     "date"
    t.string   "desc"
    t.float    "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "items", ["invoice_id"], name: "index_items_on_invoice_id"
  add_index "items", ["matter_id"], name: "index_items_on_matter_id"

  create_table "matters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.float    "rate"
    t.string   "address"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
