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

ActiveRecord::Schema.define(version: 2022_02_07_230022) do

  create_table "groups", force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_students", default: 0
    t.string "excel_file_name"
    t.string "excel_content_type"
    t.bigint "excel_file_size"
    t.datetime "excel_updated_at"
    t.index ["school_id"], name: "index_groups_on_school_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "questionnaire_id"
    t.integer "group_id"
    t.integer "student_id"
    t.string "token", null: false
    t.boolean "approved", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "requested_at"
    t.index ["group_id"], name: "index_invitations_on_group_id"
    t.index ["questionnaire_id"], name: "index_invitations_on_questionnaire_id"
    t.index ["student_id"], name: "index_invitations_on_student_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.text "description"
    t.text "regards"
    t.text "thanks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_diagnoses"
    t.integer "generated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_schools_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "status", default: 0
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_students_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.integer "permission_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
