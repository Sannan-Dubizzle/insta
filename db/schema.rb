# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_10_12_131542) do
  create_table "comments", charset: "utf8mb3", force: :cascade do |t|
    t.text "body"
    t.bigint "person_id", null: false
    t.bigint "commentable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "commentable_type"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
    t.index ["person_id"], name: "index_comments_on_person_id"
  end

  create_table "friendships", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "person1_id"
    t.bigint "person2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person1_id"], name: "index_friendships_on_person1_id"
    t.index ["person2_id"], name: "index_friendships_on_person2_id"
  end

  create_table "people", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", charset: "utf8mb3", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "person_id"
    t.index ["person_id"], name: "index_posts_on_person_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "people"
  add_foreign_key "comments", "posts", column: "commentable_id"
  add_foreign_key "friendships", "people", column: "person1_id"
  add_foreign_key "friendships", "people", column: "person2_id"
  add_foreign_key "posts", "people"
end
