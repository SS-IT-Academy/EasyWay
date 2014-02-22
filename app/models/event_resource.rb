class EventResource < ActiveRecord::Base
  attr_accessible :event_id, :resource_id
  
  belongs_to :event
  belongs_to :resource
  has_many :table_cell_items
  
  validates :event_id, :resource_id, :presence => true
end
