class ResourceValue < ActiveRecord::Base
  attr_accessible :field_id, :resource_id, :value, :resource_reference_id
  
  belongs_to :resource
  belongs_to :field
  has_one :resource_type, :through => :Resource,
    :foreign_key => "resource_reference_id"
  
  validates :field_id, :resource_id, :presence => true
end
