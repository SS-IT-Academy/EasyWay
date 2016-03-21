class DropPermissionResourcesTable < ActiveRecord::Migration
  def up
    drop_table :permission_resources
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
