class ResourceType < ActiveRecord::Base
  attr_accessible :name
  has_many :Fields, :dependent => :destroy
#  has_many :Resources
  has_many :permission_roles, as: :permissionable
 # before_destroy :check_for_Resources
  has_many :Resources, :dependent => :restrict
  validates :name, :presence => true
  validates_uniqueness_of :name  
end
