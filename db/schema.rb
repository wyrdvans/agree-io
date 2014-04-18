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

ActiveRecord::Schema.define(version: 20130315200221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "participants", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "term_id"
    t.text     "email"
    t.datetime "created_at"
  end

  add_index "participants", ["email"], name: "index_participants_on_email", using: :btree
  add_index "participants", ["term_id"], name: "index_participants_on_term_id", using: :btree

  create_table "revisions", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "term_id"
    t.uuid     "participant_id"
    t.text     "content"
    t.datetime "created_at"
  end

  add_index "revisions", ["term_id"], name: "index_revisions_on_term_id", using: :btree

  create_table "signatures", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.uuid     "participant_id", null: false
    t.uuid     "term_id",        null: false
    t.inet     "ip"
    t.macaddr  "mac"
    t.datetime "created_at"
  end

  add_index "signatures", ["participant_id"], name: "index_signatures_on_participant_id", using: :btree
  add_index "signatures", ["term_id", "participant_id"], name: "index_signatures_on_term_id_and_participant_id", unique: true, using: :btree

  create_table "terms", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.datetime "created_at"
  end

end
