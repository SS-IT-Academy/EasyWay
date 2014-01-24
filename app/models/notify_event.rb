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
end
