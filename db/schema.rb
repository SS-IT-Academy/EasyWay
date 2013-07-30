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

ActiveRecord::Schema.define(:version => 20130713125610) do

  create_table "abilities", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "event_properties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "field_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fields", :force => true do |t|
    t.string   "name"
    t.integer  "field_type_id"
    t.integer  "resource_type_id"
    t.integer  "resource_type_reference_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "menus", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "role_id"
    t.string   "url"
    t.integer  "user_id"
    t.string   "text"
    t.string   "title"
    t.string   "target"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "ancestry"
  end

  add_index "menus", ["ancestry"], :name => "index_menus_on_ancestry"

  create_table "notify_events", :force => true do |t|
    t.integer  "template_id"
    t.integer  "event_id"
    t.string   "name"
    t.integer  "observer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "recipients"
  end

  create_table "notify_observers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notify_schedulers", :force => true do |t|
    t.integer  "period"
    t.time     "start_at"
    t.time     "end_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notify_templates", :force => true do |t|
    t.string   "template_name"
    t.text     "body"
    t.text     "desc"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "permission_resources", :force => true do |t|
    t.integer  "role_id"
    t.integer  "resource_type_id"
    t.boolean  "read"
    t.boolean  "create"
    t.boolean  "edit"
    t.boolean  "destroy"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "permission_roles", :force => true do |t|
    t.integer "permissions_id"
    t.integer "roles_id"
    t.integer "permissionable_id"
    t.string  "permissionable_type"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipients", :force => true do |t|
    t.integer  "notifyevent_id"
    t.integer  "user_id"
    t.integer  "group_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "resource_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resource_values", :force => true do |t|
    t.integer  "field_id"
    t.integer  "resource_id"
    t.string   "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "description"
    t.integer  "resource_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "table_cell_items", :force => true do |t|
    t.integer  "table_template_id"
    t.integer  "resource_type_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "table_filters", :force => true do |t|
    t.integer  "table_template_id"
    t.integer  "resource_id"
    t.integer  "position_num"
    t.string   "position_float"
    t.string   "delimiter"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "table_headers", :force => true do |t|
    t.integer  "table_template_id"
    t.integer  "resource_type_id"
    t.integer  "position_num"
    t.integer  "parent_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "table_templates", :force => true do |t|
    t.string   "name"
    t.text     "cell_body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "template_mappings", :force => true do |t|
    t.string   "notifytemplatepropertyname"
    t.string   "mappedelement"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.integer  "roleid"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "authentication_token"
  end

end
