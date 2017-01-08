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

ActiveRecord::Schema.define(version: 20170104124339) do

  create_table "messages", force: :cascade do |t|
    t.integer  "sent_user_id"
    t.integer  "received_user_id"
    t.text     "message"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "student_id"
    t.integer  "star"
    t.string   "title"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.integer  "sex",                    default: 0,     null: false
    t.string   "email",                                  null: false
    t.date     "birth_day"
    t.string   "avatar"
    t.boolean  "is_teacher",             default: false, null: false
    t.string   "educational_background"
    t.text     "vision"
    t.string   "strength"
    t.integer  "shift_id"
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

end
