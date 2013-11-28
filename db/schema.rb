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

ActiveRecord::Schema.define(version: 20131128220039) do

  create_table "aircrafts", force: true do |t|
    t.string   "aircraft_type"
    t.string   "name"
    t.integer  "price"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aircrafts_prices", id: false, force: true do |t|
    t.integer "aircraft_id"
    t.integer "price_id"
  end

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs_jumpers", id: false, force: true do |t|
    t.integer "club_id"
    t.integer "jumper_id"
  end

  create_table "jumpers", force: true do |t|
    t.string   "name"
    t.string   "license"
    t.text     "description"
    t.integer  "phone"
    t.string   "email"
    t.boolean  "verified"
    t.text     "nextofkin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "licensenumber"
  end

  create_table "jumpers_ratings", id: false, force: true do |t|
    t.integer "jumper_id"
    t.integer "rating_id"
  end

  create_table "jumpers_slots", id: false, force: true do |t|
    t.integer "jumper_id"
    t.integer "slot_id"
  end

  create_table "loads", force: true do |t|
    t.string   "pilot"
    t.integer  "flighttime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aircraft_id"
    t.string   "location"
    t.integer  "loadfortheday"
    t.datetime "departure_timestamp"
  end

  create_table "prices", force: true do |t|
    t.integer  "height"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices_slots", id: false, force: true do |t|
    t.integer "price_id"
    t.integer "slot_id"
  end

  create_table "ratings", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slots", force: true do |t|
    t.integer  "height"
    t.integer  "price"
    t.boolean  "paid"
    t.boolean  "approved"
    t.string   "jumptype"
    t.boolean  "jumpmaster"
    t.integer  "jumper_id"
    t.integer  "load_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
