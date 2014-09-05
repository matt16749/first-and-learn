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

ActiveRecord::Schema.define(version: 20140905011623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text    "body",             null: false
    t.integer "user_id",          null: false
    t.string  "commentable_type", null: false
    t.integer "commentable_id",   null: false
  end

  create_table "paths", force: true do |t|
    t.string  "title",       null: false
    t.text    "description", null: false
    t.integer "user_id",     null: false
  end

  create_table "paths_tags", force: true do |t|
    t.integer "path_id", null: false
    t.integer "tag_id",  null: false
  end

  create_table "resources", force: true do |t|
    t.string  "title",                   null: false
    t.text    "description",             null: false
    t.string  "url",         limit: 500, null: false
    t.integer "user_id",                 null: false
  end

  create_table "resources_tags", force: true do |t|
    t.integer "resource_id", null: false
    t.integer "tag_id",      null: false
  end

  create_table "tags", force: true do |t|
    t.string "type", null: false
  end

  create_table "takeaways", force: true do |t|
    t.string  "body",        null: false
    t.integer "path_id",     null: false
    t.integer "resource_id", null: false
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer "user_id",       null: false
    t.boolean "vote_state",    null: false
    t.string  "voteable_type", null: false
    t.integer "voteable_id",   null: false
  end

end
