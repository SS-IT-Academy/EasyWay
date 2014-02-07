class AddDescriptionToResourceType < ActiveRecord::Migration
  def change
    add_column :resource_types, :description, :text
  end
end
