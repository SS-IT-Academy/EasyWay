class ResourceType < ActiveRecord::Base
  attr_accessible :resource_type_title
  has_many :Field
end
