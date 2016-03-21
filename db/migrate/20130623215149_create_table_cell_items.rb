class CreateTableCellItems < ActiveRecord::Migration
  def change
    create_table :table_cell_items do |t|
      t.integer :table_template_id
      t.integer :resource_type_id

      t.timestamps
    end
  end
end
