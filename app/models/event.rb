class Event < ActiveRecord::Base
  attr_accessible :recurrence_attributes, :end_at, :event_type_id, :name, :recurrence_id, :start_at
  
  has_many :event_resources, :dependent => :destroy
  has_many :resources, :through => :event_resources
  belongs_to :event_type
  belongs_to :recurrence

  accepts_nested_attributes_for :recurrence
  
  validates :name, :start_at, :end_at, :event_type_id, :presence => true

end