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

ActiveRecord::Schema.define(version: 20180606175146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.string "subtitle"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
