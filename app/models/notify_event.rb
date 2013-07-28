class NotifyEvent < ActiveRecord::Base
  attr_accessible :name, :event_id, :notify_observer_id, :notify_template_id, :recipients, :recipients_attributes, :mappings, :mappings_attributes
  
  belongs_to :notify_template
  belongs_to :event
  belongs_to :notify_observer
  has_many :recipients, :dependent => :destroy
  has_many :mappings, :through => :notify_template, :class_name => 'Mapping'
  
  validates :name, :presence => true
  validates :notify_template_id, :presence => true
  
  def choice
    self.notify_observer_id || self.event_id
  end
  
  def validates_mapping
    if :notify_event_mappings_attributes__notify_observer_property_id == 0
      errors.add(:notify_event_mappings_attributes__notify_observer_property_id,'choose some property')
      raise "Unable to create NE"
    end
  end
end
