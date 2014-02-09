class ResourceType < ActiveRecord::Base
  attr_accessible :name
  
  has_many :fields, :dependent => :destroy
  has_many :resources, :dependent => :restrict 
  has_many :resource_values, :through => :resources 
  has_many :fields_resource_values, 
  			:through => :fields, 
  			:source => :resource_values,
  			:class_name => ResourceValue
  has_many :permission_roles, as: :permissionable

  validates :name, presence: true, uniqueness: true
end
