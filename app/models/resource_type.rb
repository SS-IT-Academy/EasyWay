class ResourceType < ActiveRecord::Base
  attr_accessible :name
  has_many :Fields, :dependent => :destroy
  has_many :Resources, :dependent => :restrict
  validates :name, :presence => true
  validates_uniqueness_of :name  
end
