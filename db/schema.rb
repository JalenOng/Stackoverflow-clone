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

ActiveRecord::Schema.define(version: 20150623085131) do

  create_table "answers", force: true do |t|
    t.text     "text"
    t.integer  "user_id"
    t.integer  "question_id"
    t.boolean  "best",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "text"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["source_id", "source_type"], name: "index_comments_on_source_id_and_source_type"

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vote"
    t.integer  "vote_count"
    t.integer  "trending"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["source_id", "source_type"], name: "index_votes_on_source_id_and_source_type"

end
