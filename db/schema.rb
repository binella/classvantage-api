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

ActiveRecord::Schema.define(version: 20140204192420) do

  create_table "assessments", force: true do |t|
    t.integer  "student_id"
    t.integer  "assessable_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "assessable_type"
    t.text     "comment"
  end

  create_table "assignments", force: true do |t|
    t.string   "title"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "assignment_type"
    t.integer  "total"
  end

  create_table "checklist_items", force: true do |t|
    t.text     "criteria"
    t.integer  "checklist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checklists", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "unit_id"
    t.integer  "page_id"
    t.text     "custom_expectation"
    t.boolean  "custom_expectation_enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_copy"
  end

  create_table "checklists_overall_expectations", id: false, force: true do |t|
    t.integer "checklist_id",           null: false
    t.integer "overall_expectation_id", null: false
  end

  create_table "checklists_pages", id: false, force: true do |t|
    t.integer "checklist_id", null: false
    t.integer "page_id",      null: false
  end

  create_table "curriculums", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gradebooks", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marks", force: true do |t|
    t.integer  "assessment_id"
    t.integer  "assessable_item_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "assessable_item_type"
  end

  create_table "oauth_access_grants", force: true do |t|
    t.integer  "resource_owner_id",              null: false
    t.integer  "application_id",                 null: false
    t.string   "token",                          null: false
    t.integer  "expires_in",                     null: false
    t.string   "redirect_uri",      limit: 2048, null: false
    t.datetime "created_at",                     null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: true do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: true do |t|
    t.string   "name",                      null: false
    t.string   "uid",                       null: false
    t.string   "secret",                    null: false
    t.string   "redirect_uri", limit: 2048, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "overall_expectations", force: true do |t|
    t.text     "long_form"
    t.string   "short_form"
    t.string   "code"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "overall_expectations_rubrics", id: false, force: true do |t|
    t.integer "overall_expectation_id", null: false
    t.integer "rubric_id",              null: false
  end

  create_table "pages", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gradebook_id"
    t.integer  "grade"
    t.integer  "subject_id"
  end

  create_table "pages_rubrics", id: false, force: true do |t|
    t.integer "page_id",   null: false
    t.integer "rubric_id", null: false
  end

  add_index "pages_rubrics", ["page_id"], name: "index_pages_rubrics_on_page_id", using: :btree
  add_index "pages_rubrics", ["rubric_id"], name: "index_pages_rubrics_on_rubric_id", using: :btree

  create_table "pages_students", id: false, force: true do |t|
    t.integer "page_id",    null: false
    t.integer "student_id", null: false
  end

  add_index "pages_students", ["page_id"], name: "index_pages_students_on_page_id", using: :btree
  add_index "pages_students", ["student_id"], name: "index_pages_students_on_student_id", using: :btree

  create_table "rows", force: true do |t|
    t.text     "criteria"
    t.text     "level1_description"
    t.text     "level2_description"
    t.text     "level3_description"
    t.text     "level4_description"
    t.integer  "rubric_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rubrics", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_id"
    t.integer  "page_id"
    t.text     "custom_expectation"
    t.boolean  "custom_expectation_enabled"
    t.boolean  "is_copy"
  end

  create_table "specific_expectations", force: true do |t|
    t.string   "code"
    t.text     "description"
    t.text     "example"
    t.text     "friendly_description"
    t.integer  "overall_expectation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "strands", force: true do |t|
    t.string   "title"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "title"
    t.integer  "curriculum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string   "title"
    t.integer  "grade"
    t.integer  "strand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "name"
    t.string   "school"
    t.string   "province"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
