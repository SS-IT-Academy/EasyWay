class Event < ActiveRecord::Base
  attr_accessible :recurrence_attributes, :name, :event_type_id, :recurrence_id, :start_at, :duration
  
  has_many :event_resources, :dependent => :destroy
  has_many :resources, :through => :event_resources
  belongs_to :event_type
  belongs_to :recurrence

  accepts_nested_attributes_for :recurrence
  
  validates :name, :start_at, :duration, :event_type_id, :presence => true

end