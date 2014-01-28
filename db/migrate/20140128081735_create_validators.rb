class CreateValidators < ActiveRecord::Migration
  def change
    create_table :validators do |t|
      t.string :name
      t.string :body
      t.integer :field_type_id

      t.timestamps
    end
  end
end
