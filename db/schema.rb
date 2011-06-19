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

ActiveRecord::Schema.define(:version => 20110619091720) do

  create_table "educations", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "bigphoto_file_size"
    t.string   "bigphoto_file_name"
    t.string   "bigphoto_content_type"
    t.datetime "bigphoto_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "current",               :default => false
    t.boolean  "upcoming",              :default => false
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "bigphoto_file_size"
    t.string   "bigphoto_file_name"
    t.string   "bigphoto_content_type"
    t.datetime "bigphoto_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "current",               :default => false
    t.boolean  "upcoming",              :default => false
  end

  create_table "exhibitions", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "bigphoto_file_size"
    t.string   "bigphoto_file_name"
    t.string   "bigphoto_content_type"
    t.datetime "bigphoto_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "published",             :default => false
    t.boolean  "current",               :default => false
    t.boolean  "upcoming",              :default => false
    t.string   "x1medium"
    t.string   "y1medium"
    t.string   "widthmedium"
    t.string   "heightmedium"
    t.string   "x1thumb"
    t.string   "y1thumb"
    t.string   "widththumb"
    t.string   "heightthumb"
  end

  create_table "information", :force => true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailinglists", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailingtemplates", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "vol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.integer  "photo_file_size"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
  end

end
