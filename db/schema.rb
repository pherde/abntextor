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

ActiveRecord::Schema.define(version: 20171008115700) do

  create_table "contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "paper_id"
    t.integer  "field_id"
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["field_id"], name: "index_contents_on_field_id", using: :btree
    t.index ["paper_id"], name: "index_contents_on_paper_id", using: :btree
  end

  create_table "fields", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "label"
    t.string   "open_tag"
    t.string   "close_tag"
    t.boolean  "is_multivalue"
    t.integer  "position"
    t.integer  "section_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["section_id"], name: "index_fields_on_section_id", using: :btree
  end

  create_table "papers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "hash_name"
    t.integer  "template_id"
    t.integer  "user_id"
    t.datetime "last_build"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["hash_name"], name: "index_papers_on_hash_name", unique: true, using: :btree
    t.index ["template_id"], name: "index_papers_on_template_id", using: :btree
    t.index ["user_id"], name: "index_papers_on_user_id", using: :btree
  end

  create_table "sections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "template_id"
    t.boolean  "is_editable"
    t.boolean  "is_wysiwyg"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["template_id"], name: "index_sections_on_template_id", using: :btree
  end

  create_table "templates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "is_active"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "alias"
    t.string   "college"
    t.boolean  "is_active",              default: true
    t.boolean  "is_admin",               default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "contents", "fields"
  add_foreign_key "contents", "papers"
  add_foreign_key "fields", "sections"
  add_foreign_key "papers", "templates"
  add_foreign_key "papers", "users"
  add_foreign_key "sections", "templates"
end
