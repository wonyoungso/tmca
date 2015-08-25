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

ActiveRecord::Schema.define(:version => 20150825050336) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currents", :force => true do |t|
    t.integer  "exhibition_id"
    t.integer  "idex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0, :null => false
    t.integer  "attempts",   :default => 0, :null => false
    t.text     "handler",                   :null => false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "exhibitions", :force => true do |t|
    t.string   "title"
    t.text     "description",           :limit => 2147483647
    t.integer  "bigphoto_file_size"
    t.string   "bigphoto_file_name"
    t.string   "bigphoto_content_type"
    t.datetime "bigphoto_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "published",                                   :default => false
    t.boolean  "current",                                     :default => false
    t.boolean  "upcoming",                                    :default => false
    t.string   "x1medium"
    t.string   "y1medium"
    t.string   "widthmedium"
    t.string   "heightmedium"
    t.string   "x1thumb"
    t.string   "y1thumb"
    t.string   "widththumb"
    t.string   "heightthumb"
    t.string   "permalink"
    t.integer  "category_id"
  end

  create_table "exp_category_posts", :id => false, :force => true do |t|
    t.integer "entry_id", :default => 0, :null => false
    t.integer "cat_id",   :default => 0, :null => false
  end

  add_index "exp_category_posts", ["cat_id"], :name => "cat_id"
  add_index "exp_category_posts", ["entry_id"], :name => "entry_id"

  create_table "exp_weblog_data", :id => false, :force => true do |t|
    t.integer "entry_id",                 :default => 0,       :null => false
    t.integer "site_id",                  :default => 1,       :null => false
    t.integer "weblog_id",                :default => 0,       :null => false
    t.text    "field_id_1",                                    :null => false
    t.string  "field_ft_1", :limit => 40, :default => "xhtml", :null => false
    t.text    "field_id_2",                                    :null => false
    t.string  "field_ft_2", :limit => 40, :default => "xhtml", :null => false
    t.text    "field_id_3",                                    :null => false
    t.string  "field_ft_3", :limit => 40, :default => "xhtml", :null => false
  end

  add_index "exp_weblog_data", ["entry_id"], :name => "entry_id"
  add_index "exp_weblog_data", ["site_id"], :name => "site_id"
  add_index "exp_weblog_data", ["weblog_id"], :name => "weblog_id"

  create_table "exp_weblog_titles", :primary_key => "entry_id", :force => true do |t|
    t.integer "site_id",                                :default => 1,   :null => false
    t.integer "weblog_id",                              :default => 0,   :null => false
    t.integer "author_id",                              :default => 0,   :null => false
    t.integer "pentry_id",                              :default => 0,   :null => false
    t.integer "forum_topic_id",                         :default => 0,   :null => false
    t.string  "ip_address",              :limit => 16,  :default => "",  :null => false
    t.string  "title",                   :limit => 100, :default => "",  :null => false
    t.string  "url_title",               :limit => 75,  :default => "",  :null => false
    t.string  "status",                  :limit => 50,  :default => "",  :null => false
    t.string  "versioning_enabled",      :limit => 1,   :default => "n", :null => false
    t.integer "view_count_one",                         :default => 0,   :null => false
    t.integer "view_count_two",                         :default => 0,   :null => false
    t.integer "view_count_three",                       :default => 0,   :null => false
    t.integer "view_count_four",                        :default => 0,   :null => false
    t.string  "allow_comments",          :limit => 1,   :default => "y", :null => false
    t.string  "allow_trackbacks",        :limit => 1,   :default => "n", :null => false
    t.string  "sticky",                  :limit => 1,   :default => "n", :null => false
    t.integer "entry_date",                             :default => 0,   :null => false
    t.string  "dst_enabled",             :limit => 1,   :default => "n", :null => false
    t.string  "year",                    :limit => 4,   :default => "",  :null => false
    t.string  "month",                   :limit => 2,   :default => "",  :null => false
    t.string  "day",                     :limit => 3,   :default => "",  :null => false
    t.integer "expiration_date",                        :default => 0,   :null => false
    t.integer "comment_expiration_date",                :default => 0,   :null => false
    t.integer "edit_date",               :limit => 8
    t.integer "recent_comment_date",                    :default => 0,   :null => false
    t.integer "comment_total",                          :default => 0,   :null => false
    t.integer "trackback_total",                        :default => 0,   :null => false
    t.text    "sent_trackbacks",                                         :null => false
    t.integer "recent_trackback_date",                  :default => 0,   :null => false
  end

  add_index "exp_weblog_titles", ["author_id"], :name => "author_id"
  add_index "exp_weblog_titles", ["entry_date"], :name => "entry_date"
  add_index "exp_weblog_titles", ["expiration_date"], :name => "expiration_date"
  add_index "exp_weblog_titles", ["site_id"], :name => "site_id"
  add_index "exp_weblog_titles", ["status"], :name => "status"
  add_index "exp_weblog_titles", ["url_title"], :name => "url_title"
  add_index "exp_weblog_titles", ["weblog_id"], :name => "weblog_id"

  create_table "information", :force => true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailinglists", :id => false, :force => true do |t|
    t.integer  "id",                                       :null => false
    t.string   "authcode",   :limit => 10, :default => "", :null => false
    t.string   "email",      :limit => 50, :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mailinglists", ["id"], :name => "user_id"

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
    t.integer  "attachment_file_size"
    t.string   "attachment_content_type"
    t.string   "attachment_file_name"
    t.datetime "attachment_updated_at"
    t.string   "attachment_eng_file_name"
    t.string   "attachment_eng_content_type"
    t.integer  "attachment_eng_file_size"
    t.datetime "attachment_eng_updated_at"
    t.integer  "category_id"
  end

  create_table "pdfs", :force => true do |t|
    t.integer  "attachment_file_size"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.datetime "attachment_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pdfable_id"
    t.string   "pdfable_type"
  end

  create_table "pictures", :force => true do |t|
    t.integer  "photo_file_size"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pictureable_id"
    t.string   "pictureable_type"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
  end

end
