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

ActiveRecord::Schema.define(:version => 20140323230711) do

  create_table "checkins", :force => true do |t|
    t.integer  "user_id"
    t.string   "city"
    t.string   "country"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "places", :force => true do |t|
    t.string   "name",                                       :null => false
    t.string   "address",                                    :null => false
    t.string   "types"
    t.string   "phone_num"
    t.string   "company_url"
    t.string   "menu_url"
    t.integer  "postal_code"
    t.decimal  "latitude",    :precision => 10, :scale => 6
    t.decimal  "longitude",   :precision => 10, :scale => 6
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "recommendation_strategies", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recommendations", :force => true do |t|
    t.integer  "user_id",                    :null => false
    t.integer  "place_id",                   :null => false
    t.boolean  "like"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "recommendation_strategy_id", :null => false
  end

  create_table "user_likes", :force => true do |t|
    t.integer  "user_id"
    t.string   "category"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "uid",                                             :null => false
    t.string   "oauth_token",                                     :null => false
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.decimal  "recent_latitude",  :precision => 10, :scale => 6
    t.decimal  "recent_longitude", :precision => 10, :scale => 6
    t.integer  "age_range"
    t.string   "location"
    t.string   "gender"
  end

end
