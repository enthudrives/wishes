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

ActiveRecord::Schema.define(:version => 20121001161430) do

  create_table "recommendations", :force => true do |t|
    t.integer "wish_id"
    t.integer "user_id"
    t.string  "gem",     :null => false
  end

  add_index "recommendations", ["user_id", "wish_id"], :name => "index_recommendations_on_user_id_and_wish_id"

  create_table "users", :force => true do |t|
    t.string "name", :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer "user_id", :null => false
    t.integer "wish_id", :null => false
  end

  add_index "votes", ["user_id", "wish_id"], :name => "index_votes_on_user_id_and_wish_id"

  create_table "wishes", :force => true do |t|
    t.text    "content", :null => false
    t.integer "rank",    :null => false
    t.integer "user_id", :null => false
  end

  add_index "wishes", ["user_id"], :name => "index_wishes_on_user_id"

end
