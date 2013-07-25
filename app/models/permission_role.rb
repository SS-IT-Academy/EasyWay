class PermissionRole < ActiveRecord::Base
  attr_accessible :roles_id, :permissions_id, :permissionable_id, :permissionable_type
  belongs_to :permissionable, polymorphic: true
  belongs_to :roles
  belongs_to :permissions

  scope :with_role, lambda {|roles_id| where("roles_id = ?", roles_id)}
end