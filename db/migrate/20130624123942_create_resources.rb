class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :description
      t.integer :resource_type_id

      t.timestamps
    end
  end
end
