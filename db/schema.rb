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

ActiveRecord::Schema.define(version: 20160426225520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dashboards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delegations", force: :cascade do |t|
    t.string   "country",            null: false
    t.integer  "year",               null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "sti_delegate_id"
    t.integer  "ag_delegate1_id"
    t.integer  "ag_delegate2_id"
    t.integer  "cs_delegate1_id"
    t.integer  "cs_delegate2_id"
    t.integer  "segib_delegate1_id"
    t.integer  "segib_delegate2_id"
  end

  add_index "delegations", ["ag_delegate1_id"], name: "index_delegations_on_ag_delegate1_id", using: :btree
  add_index "delegations", ["ag_delegate2_id"], name: "index_delegations_on_ag_delegate2_id", using: :btree
  add_index "delegations", ["cs_delegate1_id"], name: "index_delegations_on_cs_delegate1_id", using: :btree
  add_index "delegations", ["cs_delegate2_id"], name: "index_delegations_on_cs_delegate2_id", using: :btree
  add_index "delegations", ["segib_delegate1_id"], name: "index_delegations_on_segib_delegate1_id", using: :btree
  add_index "delegations", ["segib_delegate2_id"], name: "index_delegations_on_segib_delegate2_id", using: :btree
  add_index "delegations", ["sti_delegate_id"], name: "index_delegations_on_sti_delegate_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.string   "province"
    t.string   "city"
    t.string   "street_name"
    t.string   "street_number"
    t.string   "zip_code"
    t.text     "details"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "locations", ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id", using: :btree

  create_table "medical_data", force: :cascade do |t|
    t.integer  "medicable_id"
    t.string   "medicable_type"
    t.boolean  "has_chronic_desease",       default: false
    t.string   "chronic_desease_detail"
    t.boolean  "take_medication",           default: false
    t.string   "medication_detail"
    t.boolean  "has_medical_background",    default: false
    t.string   "medical_background_detail"
    t.boolean  "has_allergy",               default: false
    t.string   "allergy_detail"
    t.boolean  "has_specific_diet",         default: false
    t.string   "specific_diet_detail"
    t.boolean  "is_vegetarian",             default: false
    t.string   "doctor_name"
    t.string   "doctor_phone_number"
    t.string   "urgency_clinic"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "medical_data", ["medicable_type", "medicable_id"], name: "index_medical_data_on_medicable_type_and_medicable_id", using: :btree

  create_table "partakers", force: :cascade do |t|
    t.integer  "people_id"
    t.integer  "medical_data_id"
    t.integer  "professor_id"
    t.integer  "school_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "rol"
    t.string   "type"
  end

  add_index "partakers", ["medical_data_id"], name: "index_partakers_on_medical_data_id", using: :btree
  add_index "partakers", ["people_id"], name: "index_partakers_on_people_id", using: :btree
  add_index "partakers", ["professor_id"], name: "index_partakers_on_professor_id", using: :btree
  add_index "partakers", ["school_id"], name: "index_partakers_on_school_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.integer  "personable_id"
    t.string   "personable_type"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "dni"
    t.date     "birthdate"
    t.integer  "age"
    t.integer  "location_id"
    t.string   "phone_number"
    t.string   "email"
    t.string   "blood_type"
    t.string   "rh_factor"
    t.string   "medical_insurance"
    t.string   "medical_insurance_affiliate_number"
    t.string   "medical_insurance_phone_number"
    t.string   "emergency_person"
    t.string   "emergency_person_relationship"
    t.string   "emergency_person_phone_number"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "people", ["location_id"], name: "index_people_on_location_id", using: :btree
  add_index "people", ["personable_type", "personable_id"], name: "index_people_on_personable_type_and_personable_id", using: :btree

  create_table "professors", force: :cascade do |t|
    t.integer  "people_id"
    t.integer  "medical_data_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "professors", ["medical_data_id"], name: "index_professors_on_medical_data_id", using: :btree
  add_index "professors", ["people_id"], name: "index_professors_on_people_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "phone_number"
    t.string   "fax_number"
    t.string   "email"
    t.integer  "location_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "schools", ["location_id"], name: "index_schools_on_location_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
