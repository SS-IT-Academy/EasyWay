class ResourceType < ActiveRecord::Base
  # :TODO delete descriptions
  attr_accessible :name
  has_many :Fields
  has_many :Resources
  validates :name, :presence => true
  validates_uniqueness_of :name
end
