class Event < ActiveRecord::Base
  attr_accessible :end_at, :event_type_id, :name, :recurrence_id, :start_at
  has_many :EventResources, :dependent => :destroy
  belongs_to :EventType
  belongs_to :Recurrence
  validates :name, :start_at, :end_at, :event_type_id, :presence => true
end
