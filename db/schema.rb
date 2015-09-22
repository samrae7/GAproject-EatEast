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

ActiveRecord::Schema.define(version: 20150922124939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                                                        null: false
    t.datetime "updated_at",                                                                        null: false
    t.string   "snippet_text"
    t.string   "city"
    t.string   "image_url",     default: "http://lorempixel.com/output/abstract-q-c-500-350-5.jpg"
    t.string   "display_phone"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "post_code"
    t.decimal  "latitude",      default: 51.5073
    t.decimal  "longitude",     default: 0.1276
    t.string   "categories"
    t.string   "yelp_id"
    t.boolean  "veg_friendly"
    t.string   "cuisine"
    t.boolean  "drinks"
    t.boolean  "coffee"
    t.boolean  "food"
    t.boolean  "takeaway"
    t.boolean  "delivers"
  end

  create_table "likes", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "business_id"
  end

  add_index "likes", ["business_id"], name: "index_likes_on_business_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "notes"
    t.integer  "food_rating"
    t.integer  "service_rating"
    t.integer  "value_rating"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "business_id"
  end

  add_index "reviews", ["business_id"], name: "index_reviews_on_business_id", using: :btree

  add_foreign_key "likes", "businesses"
  add_foreign_key "reviews", "businesses"
end
