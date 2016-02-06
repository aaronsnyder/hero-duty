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

ActiveRecord::Schema.define(version: 20160206212759) do

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shift_swaps", force: true do |t|
    t.integer  "original_shift_id"
    t.integer  "new_shift_id"
    t.integer  "requesting_employee_id"
    t.integer  "approving_employee_id"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", force: true do |t|
    t.integer  "employee_id"
    t.date     "on_call_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shifts", ["employee_id"], name: "index_shifts_on_employee_id"

  create_table "work_restrictions", force: true do |t|
    t.integer  "employee_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "work_restrictions", ["employee_id"], name: "index_work_restrictions_on_employee_id"

end
