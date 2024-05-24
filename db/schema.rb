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

ActiveRecord::Schema[7.1].define(version: 2024_05_24_060450) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "status"
    t.integer "category"
    t.integer "version"
    t.json "files"
    t.json "watcher"
    t.datetime "start_at"
    t.datetime "end_at"
    t.integer "estimated_man_month"
    t.integer "progress_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.integer "tracker", limit: 2
    t.integer "priority"
    t.index ["project_id"], name: "index_issues_on_project_id"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "homepage", limit: 255
    t.integer "is_public", limit: 2
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password"
    t.string "otp_secret"
    t.integer "last_otp_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.index ["project_id"], name: "index_users_on_project_id"
  end

  add_foreign_key "issues", "projects"
  add_foreign_key "issues", "users"
  add_foreign_key "users", "projects"
end
