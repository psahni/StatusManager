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

ActiveRecord::Schema.define(version: 20141213142756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "trackable_id",   null: false
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "domain_name"
    t.string   "email"
    t.string   "mobile"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "functions", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.integer  "role_id"
    t.integer  "manager_id"
    t.string   "name"
    t.string   "email",                                             null: false
    t.string   "gender",                 limit: 10
    t.date     "birthday"
    t.string   "designation",            limit: 50
    t.string   "avtar"
    t.boolean  "active",                            default: false
    t.datetime "last_logged_in"
    t.boolean  "soft_delete",                       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "team_id"
  end

  add_index "members", ["active"], name: "index_members_on_active", using: :btree
  add_index "members", ["confirmation_token"], name: "index_members_on_confirmation_token", unique: true, using: :btree
  add_index "members", ["email"], name: "index_members_on_email", unique: true, using: :btree
  add_index "members", ["manager_id"], name: "index_members_on_manager_id", using: :btree
  add_index "members", ["name"], name: "index_members_on_name", using: :btree
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  add_index "members", ["role_id"], name: "index_members_on_role_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active",      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "alarm_minutes"
    t.string   "alarm_hours"
    t.integer  "team_id"
    t.string   "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", id: false, force: true do |t|
    t.integer  "member_id"
    t.text     "yesterday_plan"
    t.text     "today_plan"
    t.text     "tomorrow_plan"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "oid"
  end

  create_table "tasks", force: true do |t|
    t.integer  "status_id"
    t.integer  "project_id"
    t.string   "activity_type"
    t.string   "activity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  add_index "teams", ["code"], name: "index_teams_on_code", using: :btree
  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree

  create_table "teams_members", force: true do |t|
    t.integer  "member_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teams_members", ["team_id", "member_id"], name: "index_teams_members_on_team_id_and_member_id", unique: true, using: :btree

end
