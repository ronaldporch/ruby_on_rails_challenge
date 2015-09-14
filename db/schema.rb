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

ActiveRecord::Schema.define(version: 20150914164427) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "visitDate"
    t.integer  "reminderDay"
    t.text     "reason"
    t.integer  "practitioner_id"
    t.integer  "customer_id"
    t.integer  "pet_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "appointments", ["customer_id"], name: "index_appointments_on_customer_id"
  add_index "appointments", ["pet_id"], name: "index_appointments_on_pet_id"
  add_index "appointments", ["practitioner_id"], name: "index_appointments_on_practitioner_id"

  create_table "customers", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.integer  "animalType"
    t.string   "breed"
    t.integer  "age"
    t.integer  "weight"
    t.datetime "lastVisit"
    t.integer  "customer_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "pets", ["customer_id"], name: "index_pets_on_customer_id"

  create_table "practitioners", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "school"
    t.integer  "schoolYears"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
