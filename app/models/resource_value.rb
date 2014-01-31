class ResourceValue < ActiveRecord::Base
  attr_accessible :field_id, :resource_id, :value, :resource_reference_id
  
  belongs_to :resource
  belongs_to :field
  belongs_to :resource_type, :through => :resource,
     :foreign_key => "resource_reference_id"
  delegate :resource_type, :to => :resource, :allow_nil => true
  validates :field_id, :resource_id, :presence => true
end
