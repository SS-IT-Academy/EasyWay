class PermissionRole < ActiveRecord::Base
  attr_accessible :roles_id, :permissions_id, :permissionable_id, :permissionable_type
  belongs_to :permissionable, polymorphic: true
  belongs_to :role, foreign_key: :roles_id
  belongs_to :permission, foreign_key: :permissions_id

  scope :with_role, lambda {|roles_id| where("roles_id = ?", roles_id)}
end