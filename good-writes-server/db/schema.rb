# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_04_173003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "piece_id", null: false
    t.integer "group_id"
    t.string "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "author_alias"
  end

  create_table "groups", force: :cascade do |t|
    t.citext "name"
    t.string "form"
    t.boolean "private"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "point_in_cycle", default: 0
  end

  create_table "pieces", force: :cascade do |t|
    t.integer "user_id"
    t.citext "title", null: false
    t.string "content", null: false
    t.string "form", null: false
    t.string "genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.citext "alias"
    t.boolean "moderator_status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "piece_id"
  end

  create_table "users", force: :cascade do |t|
    t.citext "username", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.citext "email"
    t.integer "auth_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
