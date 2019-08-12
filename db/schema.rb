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

ActiveRecord::Schema.define(version: 2019_08_11_192624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "imports", force: :cascade do |t|
    t.bigint "job_no"
    t.string "imp"
    t.string "supplier_name"
    t.string "cargo_name"
    t.string "port_of_loading"
    t.string "line"
    t.string "bl_no"
    t.string "status"
    t.string "_20_inch"
    t.string "_40_inch"
    t.string "vsl_name"
    t.string "free_days"
    t.bigint "lot_no"
    t.bigint "shifting"
    t.bigint "weight"
    t.datetime "arrived"
    t.datetime "dem_upto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
  end

  create_table "landing_pages", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "phone_number"
    t.text "query"
    t.string "logo"
    t.string "banner_image"
    t.text "about_description"
    t.string "section_1_image"
    t.string "section_2_image"
    t.string "section_1_content"
    t.string "section_2_content"
    t.string "video_url"
    t.string "section_3_icon_1"
    t.string "section_3_icon_2"
    t.string "section_3_icon_3"
    t.string "gallery_img_1"
    t.string "gallery_img_2"
    t.string "gallery_img_3"
    t.string "gallery_img_4"
    t.string "gallery_img_5"
    t.string "gallery_img_6"
    t.string "gallery_img_7"
    t.string "gallery_img_8"
    t.string "gallery_img_9"
    t.string "gallery_img_10"
    t.string "our_client_logo_1"
    t.string "our_client_logo_2"
    t.string "our_client_logo_3"
    t.string "our_client_logo_4"
    t.string "our_client_logo_5"
    t.text "testimonial_content_1"
    t.text "testimonial_content_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "testimonial_1_name"
    t.string "testimonial_2_name"
    t.string "section_3_description_1"
    t.string "section_3_description_2"
    t.string "section_3_description_3"
    t.string "custom_url"
    t.string "section_3_title_1"
    t.string "section_3_title_2"
    t.string "section_3_title_3"
  end

  create_table "leads", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "phone_number"
    t.string "category"
    t.string "city"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "source"
    t.string "host"
    t.string "user_agent"
    t.string "query"
    t.index ["user_id", "created_at"], name: "index_leads_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_leads_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_foreign_key "leads", "users"
end
