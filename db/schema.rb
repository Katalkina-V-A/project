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

ActiveRecord::Schema.define(version: 20160524153942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildingemployees", force: :cascade do |t|
    t.integer  "employee_id", null: false
    t.integer  "building_id", null: false
    t.string   "post"
    t.string   "cabinet"
    t.string   "phone"
    t.time     "startwork"
    t.time     "endwork"
    t.text     "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "buildingemployees", ["building_id"], name: "index_buildingemployees_on_building_id", using: :btree
  add_index "buildingemployees", ["employee_id", "post", "building_id"], name: "indexemployee", unique: true, using: :btree
  add_index "buildingemployees", ["employee_id"], name: "index_buildingemployees_on_employee_id", using: :btree

  create_table "buildings", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "address",                   null: false
    t.integer  "numb"
    t.integer  "typebuild",    default: [], null: false, array: true
    t.integer  "floor"
    t.integer  "state"
    t.integer  "quantityroom"
    t.text     "note"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "buildings", ["address"], name: "index_buildings_on_address", unique: true, using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "employees", force: :cascade do |t|
    t.integer  "person_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employees", ["person_id"], name: "index_employees_on_person_id", using: :btree

  create_table "furnitureinrooms", force: :cascade do |t|
    t.integer  "furniture_id", null: false
    t.integer  "room_id",      null: false
    t.integer  "quantity",     null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "furnitureinrooms", ["furniture_id", "room_id"], name: "roomfurniture", unique: true, using: :btree
  add_index "furnitureinrooms", ["furniture_id"], name: "index_furnitureinrooms_on_furniture_id", using: :btree
  add_index "furnitureinrooms", ["room_id"], name: "index_furnitureinrooms_on_room_id", using: :btree

  create_table "furnitures", force: :cascade do |t|
    t.integer  "building_id", null: false
    t.string   "name",        null: false
    t.integer  "quantity",    null: false
    t.string   "size"
    t.text     "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "furnitures", ["building_id", "name"], name: "index_furnitures_on_building_id_and_name", unique: true, using: :btree
  add_index "furnitures", ["building_id"], name: "index_furnitures_on_building_id", using: :btree

  create_table "guests", force: :cascade do |t|
    t.integer  "person_id",  null: false
    t.string   "cause"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guests", ["person_id"], name: "index_guests_on_person_id", using: :btree

  create_table "historymoves", force: :cascade do |t|
    t.integer  "tenant_id",  null: false
    t.integer  "room_id",    null: false
    t.date     "datein"
    t.date     "dateout"
    t.text     "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "historymoves", ["room_id"], name: "index_historymoves_on_room_id", using: :btree
  add_index "historymoves", ["tenant_id", "room_id", "datein"], name: "index_historymoves_on_tenant_id_and_room_id_and_datein", unique: true, using: :btree
  add_index "historymoves", ["tenant_id", "room_id", "dateout"], name: "index_historymoves_on_tenant_id_and_room_id_and_dateout", unique: true, using: :btree
  add_index "historymoves", ["tenant_id"], name: "index_historymoves_on_tenant_id", using: :btree

  create_table "linenattenants", force: :cascade do |t|
    t.integer  "tenant_id",  null: false
    t.integer  "linen_id",   null: false
    t.integer  "quantity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "linenattenants", ["linen_id"], name: "index_linenattenants_on_linen_id", using: :btree
  add_index "linenattenants", ["tenant_id", "linen_id"], name: "index_linenattenants_on_tenant_id_and_linen_id", unique: true, using: :btree
  add_index "linenattenants", ["tenant_id"], name: "index_linenattenants_on_tenant_id", using: :btree

  create_table "linens", force: :cascade do |t|
    t.integer  "building_id", null: false
    t.string   "name",        null: false
    t.integer  "quantity",    null: false
    t.string   "size"
    t.text     "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "linens", ["building_id", "name"], name: "index_linens_on_building_id_and_name", unique: true, using: :btree
  add_index "linens", ["building_id"], name: "index_linens_on_building_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "secondname"
    t.date     "birthday"
    t.integer  "sex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "people", ["lastname", "firstname", "secondname", "birthday"], name: "indexpeople", unique: true, using: :btree

  create_table "relatives", force: :cascade do |t|
    t.integer  "person_id",    null: false
    t.integer  "kin_id",       null: false
    t.string   "kin_type",     null: false
    t.string   "relationship"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "relatives", ["kin_type", "kin_id"], name: "index_relatives_on_kin_type_and_kin_id", using: :btree
  add_index "relatives", ["person_id"], name: "index_relatives_on_person_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "employee_id",    null: false
    t.integer  "historymove_id", null: false
    t.text     "content"
    t.integer  "status"
    t.date     "dateapp"
    t.date     "dateanswer"
    t.text     "answer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "requests", ["employee_id", "historymove_id", "dateapp"], name: "indexapplication", unique: true, using: :btree
  add_index "requests", ["employee_id"], name: "index_requests_on_employee_id", using: :btree
  add_index "requests", ["historymove_id"], name: "index_requests_on_historymove_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "building_id",      null: false
    t.integer  "numb",             null: false
    t.integer  "floor"
    t.integer  "section"
    t.integer  "place"
    t.integer  "typeroom"
    t.integer  "state"
    t.boolean  "fire"
    t.boolean  "signal"
    t.boolean  "samospas"
    t.integer  "accessory"
    t.integer  "accessoryfaculty"
    t.text     "note"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "rooms", ["building_id", "numb"], name: "index_rooms_on_building_id_and_numb", unique: true, using: :btree
  add_index "rooms", ["building_id"], name: "index_rooms_on_building_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "person_id",      null: false
    t.integer  "faculty",        null: false
    t.integer  "typegroup"
    t.string   "group"
    t.date     "receiptdate"
    t.date     "expirationdate"
    t.integer  "chair"
    t.integer  "course"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "students", ["person_id"], name: "index_students_on_person_id", using: :btree

  create_table "tenants", force: :cascade do |t|
    t.boolean  "security"
    t.string   "phone"
    t.date     "arrivaldate"
    t.date     "checkoutdate"
    t.text     "note"
    t.integer  "resident_id",   null: false
    t.string   "resident_type", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tenants", ["resident_type", "resident_id"], name: "index_tenants_on_resident_type_and_resident_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "visitors", force: :cascade do |t|
    t.integer  "person_id",  null: false
    t.integer  "document"
    t.string   "numb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "visitors", ["document", "numb"], name: "index_visitors_on_document_and_numb", unique: true, using: :btree
  add_index "visitors", ["person_id", "document", "numb"], name: "indexvisitor", unique: true, using: :btree
  add_index "visitors", ["person_id"], name: "index_visitors_on_person_id", using: :btree

  create_table "visitortenants", force: :cascade do |t|
    t.integer  "tenant_id",   null: false
    t.integer  "visitor_id",  null: false
    t.date     "arrivaldate"
    t.time     "arrivaltime"
    t.time     "leavetime"
    t.text     "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "visitortenants", ["tenant_id"], name: "index_visitortenants_on_tenant_id", using: :btree
  add_index "visitortenants", ["visitor_id", "tenant_id", "arrivaltime"], name: "indextenantvisitors", unique: true, using: :btree
  add_index "visitortenants", ["visitor_id"], name: "index_visitortenants_on_visitor_id", using: :btree

  create_table "workmen", force: :cascade do |t|
    t.integer  "person_id",  null: false
    t.string   "placejob"
    t.string   "post"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "workmen", ["person_id"], name: "index_workmen_on_person_id", using: :btree

  add_foreign_key "buildingemployees", "buildings"
  add_foreign_key "buildingemployees", "employees"
  add_foreign_key "employees", "people"
  add_foreign_key "furnitureinrooms", "furnitures"
  add_foreign_key "furnitureinrooms", "rooms"
  add_foreign_key "furnitures", "buildings"
  add_foreign_key "guests", "people"
  add_foreign_key "historymoves", "rooms"
  add_foreign_key "historymoves", "tenants"
  add_foreign_key "linenattenants", "linens"
  add_foreign_key "linenattenants", "tenants"
  add_foreign_key "linens", "buildings"
  add_foreign_key "relatives", "people"
  add_foreign_key "requests", "employees"
  add_foreign_key "requests", "historymoves"
  add_foreign_key "rooms", "buildings"
  add_foreign_key "students", "people"
  add_foreign_key "visitors", "people"
  add_foreign_key "visitortenants", "tenants"
  add_foreign_key "visitortenants", "visitors"
  add_foreign_key "workmen", "people"
end
