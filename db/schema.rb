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

ActiveRecord::Schema.define(version: 20161023173221) do

  create_table "bill_books", force: true do |t|
    t.integer  "customer_id"
    t.string   "bill_book_no"
    t.string   "bill_no"
    t.string   "bill_amount"
    t.string   "pending_bill"
    t.string   "bill_book_date"
    t.string   "bill_paid_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bill_books", ["customer_id"], name: "index_bill_books_on_customer_id", using: :btree

  create_table "complaints", force: true do |t|
    t.integer  "customer_id"
    t.string   "complaint_sub"
    t.text     "complaint_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "complaints", ["customer_id"], name: "index_complaints_on_customer_id", using: :btree
  add_index "complaints", ["user_id"], name: "index_complaints_on_user_id", using: :btree

  create_table "customers", force: true do |t|
    t.integer  "zone_id"
    t.date     "date"
    t.string   "name"
    t.date     "date_of_birth"
    t.text     "billing_address"
    t.string   "pin_no"
    t.string   "billing_mobile_no"
    t.string   "billing_email"
    t.string   "billing_telephone_no"
    t.string   "nationality"
    t.text     "installation_address"
    t.string   "installation_pin_no"
    t.string   "installation_telephone_no"
    t.string   "installation_mobile_no"
    t.string   "installation_email"
    t.string   "net_plan"
    t.string   "address_proof"
    t.string   "address_proof_type"
    t.string   "address_proof_no"
    t.string   "identity_proof"
    t.string   "identity_proof_type"
    t.string   "identity_proof_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "cust_id"
  end

  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree
  add_index "customers", ["zone_id"], name: "index_customers_on_zone_id", using: :btree

  create_table "designations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "employees", ["email"], name: "index_employees_on_email", unique: true, using: :btree
  add_index "employees", ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true, using: :btree

  create_table "payment_details", force: true do |t|
    t.integer  "customer_id"
    t.string   "plan_cost"
    t.string   "plan_tax"
    t.string   "monthly_payment_cost"
    t.string   "no_of_months_paid"
    t.string   "installation_charge"
    t.string   "company_material_use"
    t.string   "company_material_cost"
    t.string   "total_amount"
    t.string   "pending_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payment_details", ["customer_id"], name: "index_payment_details_on_customer_id", using: :btree

  create_table "plans", force: true do |t|
    t.integer  "customer_id"
    t.string   "plan_value"
    t.string   "plan_pattern"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["customer_id"], name: "index_plans_on_customer_id", using: :btree

  create_table "renewals", force: true do |t|
    t.integer  "customer_id"
    t.string   "renew_date"
    t.string   "renew_plan"
    t.string   "renew_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "renewals", ["customer_id"], name: "index_renewals_on_customer_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "zone_id"
    t.string   "name"
    t.string   "emp_id"
    t.string   "emp_official_mobile_no"
    t.text     "emp_local_addr"
    t.string   "date_of_birth"
    t.string   "blood_group"
    t.string   "emp_personal_mobile_no"
    t.string   "emp_personal_email"
    t.text     "emp_personal_address"
    t.string   "emergency_cotact_no"
    t.integer  "designation_id"
    t.string   "username"
    t.boolean  "gcn_admin",              default: false
  end

  add_index "users", ["designation_id"], name: "index_users_on_designation_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree
  add_index "users", ["zone_id"], name: "index_users_on_zone_id", using: :btree

  create_table "zones", force: true do |t|
    t.string   "zone_code"
    t.string   "zone_name"
    t.string   "district"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
