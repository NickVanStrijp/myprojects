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

ActiveRecord::Schema.define(version: 20160304220131) do

  create_table "projects", force: :cascade do |t|
    t.string   "project_name"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "project_desc"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "references", force: :cascade do |t|
    t.string   "ref_title"
    t.text     "ref_desc"
    t.string   "ref_link"
    t.string   "ref_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "risks", force: :cascade do |t|
    t.string   "risk_source"
    t.integer  "risk_probability"
    t.integer  "risk_impact"
    t.string   "risk_status"
    t.text     "risk_plan"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "task_name"
    t.string   "task_owner"
    t.date     "task_start_date"
    t.date     "task_end_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_first_name"
    t.string   "user_last_name"
    t.string   "user_email"
    t.string   "user_nnumber"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["user_email"], name: "index_users_on_user_email", unique: true

end
