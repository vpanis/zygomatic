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

ActiveRecord::Schema.define(version: 20170529162356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comedians", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playlist_skits", force: :cascade do |t|
    t.integer  "playlist_id"
    t.integer  "skit_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["playlist_id"], name: "index_playlist_skits_on_playlist_id", using: :btree
    t.index ["skit_id"], name: "index_playlist_skits_on_skit_id", using: :btree
  end

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_playlists_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "skit_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skit_id"], name: "index_reviews_on_skit_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "skits", force: :cascade do |t|
    t.string   "name"
    t.integer  "comedian_id"
    t.string   "video_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["comedian_id"], name: "index_skits_on_comedian_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "skit_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_tags_on_category_id", using: :btree
    t.index ["skit_id"], name: "index_tags_on_skit_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "playlist_skits", "playlists"
  add_foreign_key "playlist_skits", "skits"
  add_foreign_key "playlists", "users"
  add_foreign_key "reviews", "skits"
  add_foreign_key "reviews", "users"
  add_foreign_key "skits", "comedians"
  add_foreign_key "tags", "categories"
  add_foreign_key "tags", "skits"
end
