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

ActiveRecord::Schema.define(version: 20180624033610) do

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author"
    t.string "image_url"
    t.date "publish_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notify_books", force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
    t.integer "subscription_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_notify_books_on_book_id"
    t.index ["subscription_item_id"], name: "index_notify_books_on_subscription_item_id"
    t.index ["user_id"], name: "index_notify_books_on_user_id"
  end

  create_table "subscription_items", force: :cascade do |t|
    t.integer "sub_id"
    t.string "type"
    t.text "content", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "device_token"
    t.integer "book_id"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

end
