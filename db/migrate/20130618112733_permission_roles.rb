class PermissionRoles < ActiveRecord::Migration
  def up
    create_table :permission_roles do |t|
      t.references :permissions, :roles
      t.references :permissionable, polymorphic: true
    end
  end

  def down
    drop_table :permissions_roles
  end
end
