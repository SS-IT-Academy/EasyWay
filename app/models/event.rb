class Event < ActiveRecord::Base
  attr_accessible :recurrence_attributes, :name, :event_type_id, :recurrence_id, :start_at, :duration
  
  belongs_to :parent,	:class_name => "Event"
  has_many 	 :children, :class_name => "Event", :foreign_key=> "parent_id", :dependent => :delete_all
  
  has_many :event_resources, :dependent => :delete_all
  has_many :resources, :through => :event_resources
  belongs_to :event_type
  belongs_to :recurrence, :dependent => :destroy

  accepts_nested_attributes_for :recurrence
  
  validates :name, :start_at, :duration, :event_type_id, :presence => true

end