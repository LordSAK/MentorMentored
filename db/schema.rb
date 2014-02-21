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

ActiveRecord::Schema.define(version: 20140221101158) do

  create_table "availabilities", force: true do |t|
    t.integer  "UserID"
    t.string   "UserDays"
    t.string   "TimeFrom"
    t.string   "TimeTo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["UserID", "created_at"], name: "index_availabilities_on_UserID_and_created_at"

  create_table "communications", force: true do |t|
    t.integer  "UserID"
    t.string   "CommunicationMode"
    t.string   "CommunicationDetail"
    t.string   "Private?"
    t.string   "Preferred"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "communications", ["UserID", "created_at"], name: "index_communications_on_UserID_and_created_at"

  create_table "days", force: true do |t|
    t.string   "days"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "educations", force: true do |t|
    t.string   "UserID"
    t.string   "SchoolName"
    t.string   "SchoolFrom"
    t.string   "SchoolTo"
    t.string   "Private?"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entrepreneurs", force: true do |t|
    t.string   "entrepreneurs_mentor_subjects"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professions", force: true do |t|
    t.string   "UserID"
    t.string   "Designation"
    t.string   "Company"
    t.string   "Job_From"
    t.string   "Job_To"
    t.string   "Private?"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "student_mentor_subjects"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "First_Name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "Last_Name"
    t.string   "user_Type"
    t.string   "SkillType"
    t.string   "user_Need"
    t.string   "user_City"
    t.string   "user_State"
    t.string   "user_Zip"
    t.string   "SkillType1"
    t.string   "SkillNeed1"
    t.string   "SkillType2"
    t.string   "skillNeed2"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "veterans", force: true do |t|
    t.string   "veteran_mentor_subjects"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
