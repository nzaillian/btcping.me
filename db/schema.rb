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

ActiveRecord::Schema.define(version: 20140613173742) do

  create_table "price_notifications", force: true do |t|
    t.integer  "user_id"
    t.string   "exchange"
    t.decimal  "price",                   precision: 8, scale: 2
    t.decimal  "last_notification_price", precision: 8, scale: 2
    t.datetime "last_notification_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "direction"
    t.string   "uuid"
  end

  add_index "price_notifications", ["direction"], name: "index_price_notifications_on_direction"
  add_index "price_notifications", ["exchange"], name: "index_price_notifications_on_exchange"
  add_index "price_notifications", ["last_notification_time"], name: "index_price_notifications_on_last_notification_time"
  add_index "price_notifications", ["price"], name: "index_price_notifications_on_price"
  add_index "price_notifications", ["user_id"], name: "index_price_notifications_on_user_id"
  add_index "price_notifications", ["uuid"], name: "index_price_notifications_on_uuid"

  create_table "users", force: true do |t|
    t.string   "uuid"
    t.string   "slug"
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role"
    t.string   "nickname"
    t.boolean  "canceled"
    t.string   "avatar"
    t.boolean  "active"
    t.boolean  "account_on_hold"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["role"], name: "index_users_on_role"
  add_index "users", ["slug"], name: "index_users_on_slug"
  add_index "users", ["uuid"], name: "index_users_on_uuid"

end
