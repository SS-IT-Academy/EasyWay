class CreateMappings < ActiveRecord::Migration
  def change
    create_table :mappings do |t|
      t.integer :notify_observer_property_id
      t.string :template_parameter
      t.integer :notify_template_id

      t.timestamps
    end
  end
end
