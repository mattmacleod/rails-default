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

ActiveRecord::Schema.define(:version => 20110720205923) do

  create_table "bookings", :force => true do |t|
    t.integer  "performance_id"
    t.integer  "writer_id"
    t.integer  "issue_id"
    t.boolean  "sumbitted",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.string   "category"
    t.boolean  "scheduled",     :default => false
    t.boolean  "has_pic",       :default => false
    t.string   "cached_venues"
    t.string   "cached_times"
    t.string   "cached_dates"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "performances", :force => true do |t|
    t.integer  "event_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "venue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "performances", ["event_id"], :name => "index_performances_on_event_id"

  create_table "writers", :force => true do |t|
    t.string   "name"
    t.integer  "review_limit", :default => 0
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
