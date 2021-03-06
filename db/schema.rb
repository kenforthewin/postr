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

ActiveRecord::Schema.define(version: 20141027195000) do

  create_table "comments", force: true do |t|
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "yak_id"
    t.integer  "score"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
  end

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

  create_table "yaks", force: true do |t|
    t.integer  "score"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
  end

  add_index "yaks", ["cached_votes_down"], name: "index_yaks_on_cached_votes_down"
  add_index "yaks", ["cached_votes_score"], name: "index_yaks_on_cached_votes_score"
  add_index "yaks", ["cached_votes_total"], name: "index_yaks_on_cached_votes_total"
  add_index "yaks", ["cached_votes_up"], name: "index_yaks_on_cached_votes_up"
  add_index "yaks", ["cached_weighted_average"], name: "index_yaks_on_cached_weighted_average"
  add_index "yaks", ["cached_weighted_score"], name: "index_yaks_on_cached_weighted_score"
  add_index "yaks", ["cached_weighted_total"], name: "index_yaks_on_cached_weighted_total"

end
