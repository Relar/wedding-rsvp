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

ActiveRecord::Schema.define(:version => 20110208045023) do

  create_table "families", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.string    "phone"
    t.string    "street_address"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "rsvp_message",        :limit => 1024
    t.boolean   "accepted_disclaimer"
  end

  create_table "meals", :force => true do |t|
    t.string    "name"
    t.float     "price"
    t.boolean   "is_adult"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "people", :force => true do |t|
    t.integer   "family_id"
    t.string    "first_name"
    t.string    "last_name"
    t.boolean   "is_invited_ceremony"
    t.boolean   "is_attending_ceremony"
    t.boolean   "is_attending_reception"
    t.boolean   "is_adult"
    t.integer   "meal_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "rsvps", :force => true do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "login"
    t.string    "crypted_password"
    t.string    "persistence_token"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "name"
  end

end
