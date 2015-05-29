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

ActiveRecord::Schema.define(version: 20150529194515) do

  create_table "hashtags", force: :cascade do |t|
    t.integer "tweet_id"
    t.string  "tag"
    t.integer "occurences"
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "tweet_id"
    t.datetime "tweeted_at"
    t.string   "text"
    t.string   "user"
    t.string   "user_url"
    t.string   "user_image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
