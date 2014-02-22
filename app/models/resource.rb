class Resource < ActiveRecord::Base
  attr_accessible :description, :resource_type_id
  
  belongs_to :resource_type
  has_many :resource_values, :dependent => :destroy
  has_many :event_resources
  has_many :permission_roles, as: :permissionable
  
  validates :resource_type_id, :presence => true
  
  scope :by_resource_type, lambda { |resource_type_id| where("resource_type_id = ?", resource_type_id) }
end
