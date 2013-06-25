class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :field_type_id
      t.integer :resource_type_id

      t.timestamps
    end
  end
end
