class PermissionResource < ActiveRecord::Base
  attr_accessible :create, :destroy, :edit, :read, :resource_type_id, :role_id
  belongs_to :resource_type
  belongs_to :role
end
