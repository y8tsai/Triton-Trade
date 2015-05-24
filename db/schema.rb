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

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20150520024004) do
=======
ActiveRecord::Schema.define(version: 20150524030418) do
>>>>>>> f89a8cb239778d019fe1817c908917a8328f8260
=======
ActiveRecord::Schema.define(version: 20150524030418) do
>>>>>>> 33b0ebd8efe8044eab768be48f3c41c7d7e45db2

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 33b0ebd8efe8044eab768be48f3c41c7d7e45db2
  create_table "average_caches", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
>>>>>>> f89a8cb239778d019fe1817c908917a8328f8260
=======
>>>>>>> 33b0ebd8efe8044eab768be48f3c41c7d7e45db2
  create_table "items", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_sold",                             default: false
    t.decimal  "price",       precision: 6, scale: 2
    t.string   "image_url"
    t.string   "condition"
    t.integer  "user_id"
    t.string   "role"
  end

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 33b0ebd8efe8044eab768be48f3c41c7d7e45db2
  create_table "overall_averages", force: true do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

<<<<<<< HEAD
>>>>>>> f89a8cb239778d019fe1817c908917a8328f8260
=======
>>>>>>> 33b0ebd8efe8044eab768be48f3c41c7d7e45db2
  create_table "profiles", force: true do |t|
    t.string   "profile",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 33b0ebd8efe8044eab768be48f3c41c7d7e45db2
  create_table "rates", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

<<<<<<< HEAD
>>>>>>> f89a8cb239778d019fe1817c908917a8328f8260
=======
>>>>>>> 33b0ebd8efe8044eab768be48f3c41c7d7e45db2
  create_table "searches", force: true do |t|
    t.string   "search",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "item_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["item_id"], name: "index_taggings_on_item_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "PID"
    t.datetime "date_of_birth"
    t.boolean  "is_female",              default: false
    t.string   "avatar_url"
    t.string   "role"
<<<<<<< HEAD
<<<<<<< HEAD
=======
    t.string   "name"
>>>>>>> f89a8cb239778d019fe1817c908917a8328f8260
=======
    t.string   "name"
>>>>>>> 33b0ebd8efe8044eab768be48f3c41c7d7e45db2
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "widgets", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
