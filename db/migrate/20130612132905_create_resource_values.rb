class CreateResourceValues < ActiveRecord::Migration
  def change
    create_table :resource_values do |t|
      t.integer :resource_id
      t.integer :field_id
      t.string :value
      t.Resource :resource_reference

      t.timestamps
    end
  end
end
