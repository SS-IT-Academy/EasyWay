# encoding: UTF-8

ActiveRecord::Schema.define(:version => 20130613001634) do

  create_table "table_cell_items", :force => true do |t|
    t.integer  "table_template_id"
    t.string   "resource_type_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "table_filters", :force => true do |t|
    t.integer  "table_template_id"
    t.integer  "resource_id"
    t.integer  "position_num"
    t.integer  "position_float"
    t.string   "delimiter"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "table_headers", :force => true do |t|
    t.integer  "table_template_id"
    t.string   "resource_type_id"
    t.integer  "position_num"
    t.integer  "parent_id"
    t.integer  "orientation"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "table_templates", :force => true do |t|
    t.text     "cell_body"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "description"
    t.integer  "resource_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end
end