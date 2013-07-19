class EventResource < ActiveRecord::Base
  attr_accessible :event_id, :resource_id
  belongs_to :Event
  belongs_to :Resource
  has_many :TableCellItems
  validates :event_id, :resource_id, :presence => true
end
