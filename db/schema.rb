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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120229173635) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "bookmarks", :force => true do |t|
    t.string   "b_id"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "zip"
    t.string   "city"
    t.string   "state"
    t.string   "email"
    t.string   "year_established"
    t.string   "payment_method"
    t.text     "parking"
    t.string   "mon_hours"
    t.string   "tues_hours"
    t.string   "wed_hours"
    t.string   "thurs_hours"
    t.string   "fri_hours"
    t.string   "sat_hours"
    t.string   "sun_hours"
    t.string   "other_hours"
    t.string   "parent_cat_id"
    t.string   "child_cat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.integer  "listinglevel"
    t.integer  "status",             :default => 1, :null => false
    t.text     "description"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "tag_line"
  end

  create_table "businesses_in_categories", :force => true do |t|
    t.string   "b_id"
    t.string   "cat_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "parent_cat_id"
    t.integer  "child_cat_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "user_id"
    t.string   "item_id"
    t.text     "body"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comment_type"
  end

  create_table "coupons", :force => true do |t|
    t.string   "b_id"
    t.string   "headline"
    t.text     "body"
    t.date     "expire"
    t.string   "exclusion"
    t.string   "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "b_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "b_id"
    t.string   "title"
    t.text     "body"
    t.string   "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "services", :force => true do |t|
    t.string   "b_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.date     "birthday"
    t.string   "username"
    t.string   "user_type"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "time_zone"
  end

end
