class ResourceType < ActiveRecord::Base
  attr_accessible :name
  has_many :Fields, :dependent => :destroy
  has_many :Resources
 # before_destroy :check_for_Resources
  validates :name, :presence => true
  validates_uniqueness_of :name
 # def check_for_Resources
   # if resources.count > 0
    #  errors.add_to_base("cannot delete resource type while resources exist")
    #  return false
    #end
  #end
end
