class ResourceType < ActiveRecord::Base
  attr_accessible :name
  
  has_many :fields, :dependent => :destroy
  has_many :resources, :dependent => :restrict  
  has_many :permission_roles, as: :permissionable

  validates :name, :presence => true
  validates_uniqueness_of :name  
end
