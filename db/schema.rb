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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110624164750) do

  create_table "reports", :force => true do |t|
    t.string   "title",                 :null => false
    t.integer  "user_id",               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "raw_file_file_name"
    t.string   "raw_file_content_type"
    t.integer  "raw_file_file_size"
    t.datetime "raw_file_updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name",                                          :null => false
    t.string   "public_key", :limit => 2048,                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                      :default => false
  end

  add_index "users", ["public_key"], :name => "index_users_on_public_key", :length => {"public_key"=>255}

end
