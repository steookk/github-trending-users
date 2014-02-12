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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140212105704) do

  create_table "github_users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "fullname"
    t.string   "type_of_user"
    t.boolean  "hireable",     :default => false
    t.integer  "public_repos", :default => 0
    t.string   "email"
  end

  create_table "repositories", :force => true do |t|
    t.string   "name"
    t.string   "html_url"
    t.string   "language"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "github_user_id"
  end

end
