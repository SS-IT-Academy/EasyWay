class CreateTableHeaders < ActiveRecord::Migration
  def change
    create_table :table_headers do |t|
      t.integer :table_template_id
      t.string :resource_type_id
      t.integer :position_num
      t.integer :parent_id
      t.integer :orientation

      t.timestamps
    end
  end
end
