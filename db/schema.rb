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

ActiveRecord::Schema.define(version: 20170610172432) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experiences", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.float    "vista"
    t.float    "olfato"
    t.float    "gusto"
    t.float    "oido"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "expe"
    t.integer  "money"
    t.string   "currency"
    t.string   "aprox_time"
    t.integer  "gente"
    t.string   "idioma"
    t.boolean  "is_risky"
    t.boolean  "is_internet"
    t.boolean  "is_reservation"
    t.string   "website"
    t.text     "advice"
    t.integer  "nomad_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "address"
  end

  add_index "experiences", ["nomad_id"], name: "index_experiences_on_nomad_id", using: :btree

  create_table "nomads", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "nomads", ["email"], name: "index_nomads_on_email", unique: true, using: :btree
  add_index "nomads", ["reset_password_token"], name: "index_nomads_on_reset_password_token", unique: true, using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "experience_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "photos", ["experience_id"], name: "index_photos_on_experience_id", using: :btree

  add_foreign_key "experiences", "nomads"
  add_foreign_key "photos", "experiences"
end
