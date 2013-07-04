class ResourceValue < ActiveRecord::Base
  attr_accessible :field_id, :resource_id, :resource_reference_id, :value
  belongs_to :Resource,
    :foreign_key => "resource_id"
  belongs_to :Field,
    :foreign_key => "field_id"
  has_one :ResourceType, :through => :Resource,
    :foreign_key => "resource_reference_id"
  validates :field_id, :resource_id, :value, :presence => true
end
