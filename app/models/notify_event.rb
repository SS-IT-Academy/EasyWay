class NotifyEvent < ActiveRecord::Base
  attr_accessible :name, :event_id, :notify_observer_id, :notify_template_id, :recipients_attributes
  validates :name, :presence => true
  validates :notify_template_id, :presence => true
  belongs_to :notify_template
  belongs_to :event
  belongs_to :notify_observer
  has_many :recipients
  accepts_nested_attributes_for :recipients
  
  def choice
  self.notify_observer_id || self.event_id
  end
end
