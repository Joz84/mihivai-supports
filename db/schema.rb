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


ActiveRecord::Schema.define(version: 2018_06_08_093658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pdf"
    t.bigint "training_id"
    t.index ["training_id"], name: "index_courses_on_training_id"
  end

  create_table "landing_pages", force: :cascade do |t|
    t.text "html"
    t.text "css"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "rating"
  end

  create_table "landing_pages_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "landing_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landing_page_id"], name: "index_landing_pages_users_on_landing_page_id"
    t.index ["user_id"], name: "index_landing_pages_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "url"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_users", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_projects_users_on_project_id"
    t.index ["user_id"], name: "index_projects_users_on_user_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.bigint "school_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_promotions_on_school_id"
  end

  create_table "promotions_trainings", force: :cascade do |t|
    t.bigint "promotion_id"
    t.bigint "training_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_promotions_trainings_on_promotion_id"
    t.index ["training_id"], name: "index_promotions_trainings_on_training_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.text "resume"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "promotion_id"
    t.string "group"
    t.text "description"
    t.string "first_name"
    t.string "last_name"
    t.string "site"
    t.string "linkedin"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["promotion_id"], name: "index_users_on_promotion_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "trainings"
  add_foreign_key "landing_pages_users", "landing_pages"
  add_foreign_key "landing_pages_users", "users"
  add_foreign_key "projects_users", "projects"
  add_foreign_key "projects_users", "users"
  add_foreign_key "promotions", "schools"
  add_foreign_key "promotions_trainings", "promotions"
  add_foreign_key "promotions_trainings", "trainings"
  add_foreign_key "users", "promotions"
end
