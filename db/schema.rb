# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_22_044219) do
  create_table "client_answers", force: :cascade do |t|
    t.integer "client_legal_form_id", null: false
    t.string "question"
    t.decimal "position"
    t.string "question_type"
    t.string "options"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_legal_form_id"], name: "index_client_answers_on_client_legal_form_id"
  end

  create_table "client_legal_forms", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "legal_form_id", null: false
    t.string "form_hash"
    t.datetime "first_login_date"
    t.datetime "most_recent_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_legal_forms_on_client_id"
    t.index ["legal_form_id"], name: "index_client_legal_forms_on_legal_form_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legal_form_questions", force: :cascade do |t|
    t.string "question"
    t.string "question_type"
    t.integer "position"
    t.string "options"
    t.integer "legal_form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_form_id"], name: "index_legal_form_questions_on_legal_form_id"
  end

  create_table "legal_forms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "client_answers", "client_legal_forms"
  add_foreign_key "client_legal_forms", "clients"
  add_foreign_key "client_legal_forms", "legal_forms"
  add_foreign_key "legal_form_questions", "legal_forms"
end
