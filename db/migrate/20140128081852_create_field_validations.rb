class CreateFieldValidations < ActiveRecord::Migration
  def change
    create_table :field_validations do |t|
      t.integer :validator_id
      t.integer :field_id

      t.timestamps
    end
  end
end
