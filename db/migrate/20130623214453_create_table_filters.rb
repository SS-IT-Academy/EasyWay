class CreateTableFilters < ActiveRecord::Migration
  def change
    create_table :table_filters do |t|
      t.integer :table_template_id
      t.integer :resource_id
      t.integer :position_num
      t.string :position_float
      t.string :delimiter

      t.timestamps
    end
  end
end
