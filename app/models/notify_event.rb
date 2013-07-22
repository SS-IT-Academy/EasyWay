class NotifyEvent < ActiveRecord::Base
  attr_accessible :event_id, :name, :observer_id, :template_id, :recipients_attributes
  validates :name, :presence => true
  validates :template_id, :presence => true
  belongs_to :templates
  belongs_to :events
  belongs_to :notifyobserver
  has_many :recipients
def choice
  self.observer_id || self.event_id
end
end
