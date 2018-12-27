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

ActiveRecord::Schema.define(version: 2018_12_05_122136) do

  create_table "blogs", force: :cascade do |t|
    t.integer "f_user_id", null: false
    t.string "b_title", null: false
    t.text "b_body", null: false
    t.text "b_image_id"
    t.integer "b_category", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "c_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "company", null: false
    t.string "name", null: false
    t.string "industry", null: false
    t.text "image_id"
    t.text "profile"
    t.text "hp_url"
    t.string "conv_time"
    t.string "tell", null: false
    t.integer "post_code", null: false
    t.text "address", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_c_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_c_users_on_reset_password_token", unique: true
  end

  create_table "chatrooms", force: :cascade do |t|
    t.integer "c_user_id", null: false
    t.integer "f_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crops_calendars", force: :cascade do |t|
    t.integer "f_user_id", null: false
    t.string "crops", null: false
    t.integer "Jan", default: 0, null: false
    t.integer "Feb", default: 0, null: false
    t.integer "Mar", default: 0, null: false
    t.integer "Apr", default: 0, null: false
    t.integer "May", default: 0, null: false
    t.integer "Jun", default: 0, null: false
    t.integer "Jul", default: 0, null: false
    t.integer "Aug", default: 0, null: false
    t.integer "Sep", default: 0, null: false
    t.integer "Oct", default: 0, null: false
    t.integer "Nov", default: 0, null: false
    t.integer "Dec", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "f_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "farm", null: false
    t.string "name", null: false
    t.text "image_id"
    t.text "profile"
    t.text "hp_url"
    t.string "conv_time"
    t.string "tell", null: false
    t.integer "post_code", null: false
    t.text "address", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_f_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_f_users_on_reset_password_token", unique: true
  end

  create_table "favorite_hearts", force: :cascade do |t|
    t.integer "c_user_id", null: false
    t.integer "proposal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["c_user_id"], name: "index_favorite_hearts_on_c_user_id"
    t.index ["proposal_id"], name: "index_favorite_hearts_on_proposal_id"
  end

  create_table "favorite_stars", force: :cascade do |t|
    t.integer "f_user_id", null: false
    t.integer "request_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["f_user_id"], name: "index_favorite_stars_on_f_user_id"
    t.index ["request_id"], name: "index_favorite_stars_on_request_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "text", null: false
    t.integer "chatroom_id", null: false
    t.boolean "f_user", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.integer "f_user_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.text "p_image_id"
    t.string "location", null: false
    t.datetime "start_season", null: false
    t.datetime "finish_season", null: false
    t.integer "category", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.integer "c_user_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.string "location", null: false
    t.datetime "start_season", null: false
    t.datetime "finish_season", null: false
    t.integer "category", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
