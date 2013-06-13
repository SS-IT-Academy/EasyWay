class ResourceValue < ActiveRecord::Base
  attr_accessible :field_id, :resource_id, :resource_reference, :value
  has_one :Resource
  has_one :Field
end
