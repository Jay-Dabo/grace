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

ActiveRecord::Schema.define(version: 20170501163819) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "churches", force: :cascade do |t|
    t.string   "name"
    t.string   "denomination"
    t.string   "church_image"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  create_table "giving_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "church_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "giving_types", ["church_id"], name: "index_giving_types_on_church_id", using: :btree

  create_table "givings", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "member_id"
    t.decimal  "amount"
    t.date     "date_given"
    t.integer  "giving_type_id"
    t.integer  "church_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_members", ["group_id"], name: "index_group_members_on_group_id", using: :btree
  add_index "group_members", ["member_id"], name: "index_group_members_on_member_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "group_image"
    t.integer  "church_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "members", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "first_name"
    t.string   "gender"
    t.integer  "church_id"
    t.string   "email"
    t.string   "phone"
    t.string   "member_image"
    t.date     "birthday"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "last_name"
    t.text     "interest"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  add_foreign_key "giving_types", "churches"
  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "members"
end
