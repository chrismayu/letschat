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

ActiveRecord::Schema.define(version: 20161129130818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "details", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "email_able",             default: false
    t.string   "details_email"
    t.string   "cellphone"
    t.string   "phone2"
    t.integer  "country_id"
    t.integer  "state_id"
    t.string   "city"
    t.string   "address"
    t.string   "province"
    t.string   "country"
    t.string   "social_link_1"
    t.string   "social_link_2"
    t.string   "social_link_3"
    t.string   "social_link_4"
    t.string   "social_link_5"
    t.string   "social_link_6"
    t.string   "social_link_7"
    t.string   "social_link_8"
    t.string   "social_link_9"
    t.string   "social_link_10"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "slug"
    t.string   "name"
    t.string   "social_link_1_icon"
    t.string   "social_link_1_url"
    t.integer  "social_link_1_icon_id"
    t.string   "social_link_2_icon"
    t.string   "social_link_2_url"
    t.integer  "social_link_2_icon_id"
    t.string   "social_link_3_icon"
    t.string   "social_link_3_url"
    t.integer  "social_link_3_icon_id"
    t.string   "social_link_4_icon"
    t.string   "social_link_4_url"
    t.integer  "social_link_4_icon_id"
    t.string   "social_link_5_icon"
    t.string   "social_link_5_url"
    t.integer  "social_link_5_icon_id"
    t.string   "social_link_6_icon"
    t.string   "social_link_6_url"
    t.integer  "social_link_6_icon_id"
    t.string   "social_link_7_icon"
    t.string   "social_link_7_url"
    t.integer  "social_link_7_icon_id"
    t.string   "social_link_8_icon"
    t.string   "social_link_8_url"
    t.integer  "social_link_8_icon_id"
    t.string   "social_link_9_icon"
    t.string   "social_link_9_url"
    t.integer  "social_link_9_icon_id"
    t.string   "social_link_10_icon"
    t.string   "social_link_10_url"
    t.integer  "social_link_10_icon_id"
  end

  create_table "icons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "detail_id"
    t.string   "icon_css"
    t.string   "name"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "top_icons",  default: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.integer  "role"
    t.boolean  "yes_receive_email",      default: false
    t.string   "display_name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "slug"
    t.string   "profile_image_id"
    t.boolean  "keep_private",           default: false
    t.boolean  "demo_user",              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
