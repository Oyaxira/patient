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

ActiveRecord::Schema.define(version: 20161013033136) do

  create_table "locations", force: :cascade do |t|
    t.string   "code",       limit: 10
    t.string   "name",       limit: 80, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "first_name",    limit: 30,                 null: false
    t.string   "middle_name",   limit: 10
    t.string   "last_name",     limit: 30,                 null: false
    t.datetime "birth"
    t.integer  "gender"
    t.integer  "status",                                   null: false
    t.integer  "location_id",                              null: false
    t.integer  "viewed_count",             default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "delete_status",            default: false
    t.index ["location_id"], name: "index_patients_on_location_id"
  end

end
