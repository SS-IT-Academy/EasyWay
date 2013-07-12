class CreatePermissionResources < ActiveRecord::Migration
  def change
    create_table :permission_resources do |t|
      t.integer :role_id
      t.integer :resource_type_id
      t.boolean :read
      t.boolean :create
      t.boolean :edit
      t.boolean :destroy

      t.timestamps
    end
  end
end
