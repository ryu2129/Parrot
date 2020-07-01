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

ActiveRecord::Schema.define(version: 2020_06_30_111105) do

  create_table "artists", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "image"
    t.text "profile"
    t.boolean "is_enabled", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artists_on_name"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.integer "member_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "member_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: "", null: false
    t.string "image"
    t.text "profile"
    t.boolean "is_enabled", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["name"], name: "index_members_on_name"
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "posts", force: :cascade do |t|
    t.integer "member_id"
    t.integer "artist_id"
    t.string "title"
    t.text "introduction"
    t.string "image"
    t.datetime "schedule"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "watching_method", default: 1, null: false
    t.string "detailed_url"
    t.integer "admission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_posts_on_artist_id"
    t.index ["member_id"], name: "index_posts_on_member_id"
  end

end
