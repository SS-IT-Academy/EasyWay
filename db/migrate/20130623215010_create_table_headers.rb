class CreateTableHeaders < ActiveRecord::Migration
  def change
    create_table :table_headers do |t|
      t.integer :table_template_id
      t.integer :resource_type_id
      t.integer :position_num
      t.integer :parent_id

      t.timestamps
    end
  end
end
