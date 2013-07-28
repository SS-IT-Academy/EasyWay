class Event < ActiveRecord::Base

  attr_accessible :end_at, :event_type_id, :name, :recurrence_id, :start_at
  has_many :event_resources, :dependent => :destroy
  has_many :resources, :through => :event_resources
  belongs_to :event_type
  belongs_to :recurrence
  validates :name, :start_at, :end_at, :event_type_id, :presence => true

end
