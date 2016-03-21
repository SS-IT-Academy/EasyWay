class CreateResourceValues < ActiveRecord::Migration
  def change
    create_table :resource_values do |t|
      t.integer :field_id
      t.integer :resource_id
      t.integer :resource_reference_id
      t.string :value

      t.timestamps
    end
  end
end
