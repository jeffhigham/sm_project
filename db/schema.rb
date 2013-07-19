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

ActiveRecord::Schema.define(:version => 20130711162924) do

  create_table "customers", :force => true do |t|
    t.string   "email"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.string   "billing"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "password_digest"
    t.string   "password"
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
  end

  create_table "driveway_lengths", :force => true do |t|
    t.text     "name"
    t.integer  "feet"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "driveway_types", :force => true do |t|
    t.string   "property_id"
    t.string   "integer"
    t.string   "name"
    t.integer  "width"
    t.datetime "created_at",                                                        :null => false
    t.datetime "updated_at",                                                        :null => false
    t.text     "image_url",   :default => "http://placehold.it/100x100&text=House"
  end

  create_table "payment_notifications", :force => true do |t|
    t.text     "params"
    t.string   "status"
    t.string   "transaction_id"
    t.integer  "work_order_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "properties", :force => true do |t|
    t.integer  "customer_id"
    t.string   "address"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "public_record_url"
    t.text     "notes"
    t.boolean  "primary"
    t.string   "profile_photo_1_file_name"
    t.string   "profile_photo_1_content_type"
    t.integer  "profile_photo_1_file_size"
    t.datetime "profile_photo_1_updated_at"
    t.string   "profile_photo_2_file_name"
    t.string   "profile_photo_2_content_type"
    t.integer  "profile_photo_2_file_size"
    t.datetime "profile_photo_2_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.integer  "driveway_type_id"
    t.integer  "driveway_length_id"
    t.integer  "sidewalk_length_id"
  end

  create_table "removal_preferences", :force => true do |t|
    t.string   "name"
    t.string   "preference"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sidewalk_lengths", :force => true do |t|
    t.text     "name"
    t.integer  "feet"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "snow_depths", :force => true do |t|
    t.text     "name"
    t.integer  "inches"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "work_orders", :force => true do |t|
    t.integer  "property_id"
    t.date     "completed_date"
    t.boolean  "notify"
    t.datetime "created_at",                                                                                       :null => false
    t.datetime "updated_at",                                                                                       :null => false
    t.string   "before_photo_file_name"
    t.string   "before_photo_content_type"
    t.integer  "before_photo_file_size"
    t.datetime "before_photo_updated_at"
    t.string   "after_photo_file_name"
    t.string   "after_photo_content_type"
    t.integer  "after_photo_file_size"
    t.datetime "after_photo_updated_at"
    t.decimal  "price",                     :precision => 5, :scale => 2, :default => 0.0
    t.integer  "discount",                                                :default => 0
    t.text     "due_date",                                                :default => "1970-01-01 00:00:00 -0600"
    t.text     "deice_sidewalk",                                          :default => "Yes"
    t.text     "paid"
    t.integer  "removal_preferences_id"
    t.integer  "snow_depth_id"
    t.text     "saved"
  end

end
