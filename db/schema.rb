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

ActiveRecord::Schema.define(:version => 20120731143438) do

  create_table "Roqs", :force => true do |t|
    t.integer  "question_id"
    t.integer  "option_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "next_id"
  end

  create_table "Users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.boolean  "admin",           :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "username"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "Users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "Users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "Users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.integer  "answer_id"
    t.string   "remember_token"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "answer"
  end

  create_table "options", :force => true do |t|
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pq_relations", :force => true do |t|
    t.integer  "project_id"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "version"
    t.boolean  "active",         :default => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "start_question"
  end

  create_table "questions", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "answer_type", :default => ""
    t.string   "audio_url",   :default => ""
    t.string   "picture_url", :default => ""
  end

  add_index "questions", ["name"], :name => "index_questions_on_name", :unique => true

  create_table "rpqs", :force => true do |t|
    t.integer  "project_id"
    t.string   "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "rpqs", ["project_id", "question_id"], :name => "index_rpqs_on_project_id_and_question_id", :unique => true

end
