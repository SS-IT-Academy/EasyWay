class CreateResourceValues < ActiveRecord::Migration
  def change
    create_table :resource_values do |t|
      t.integer :resource_id
      t.integer :field_id
      t.string :value
      t.integer :resource_reference_id

      t.timestamps
    end
  end
end
