class AddResourceIdToMappings < ActiveRecord::Migration
  def change
  	add_column :mappings, :resource_id, :string
  end
end
