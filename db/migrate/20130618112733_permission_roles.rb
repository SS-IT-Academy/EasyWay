class PermissionRoles < ActiveRecord::Migration
  def up
    create_table :permissions_roles, :id => false do |t|
    t.references :permissions, :roles
  end
end

  def down
    drop_table :permissions_roles
  end
end
