class ResourceType < ActiveRecord::Base
  # :TODO delete descriptions
  attr_accessible :resource_type_name
  has_many :Fields
  has_many :Resources
  validates :resource_type_name, :presence => true
  validates_uniqueness_of :resource_type_name
end
