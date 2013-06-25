class NotifyEvent < ActiveRecord::Base
  attr_accessible :event_id, :name, :observer_id, :template_id
  validates :name, :presence => true
  validates :template_id, :presence => true
  validates :event_id, :presence => true
  validates :observer_id, :presence => true
  validates :define, :presence => true
  belongs_to :templates
  belongs_to :events
  belongs_to :notifyobserver

def define
  self.observer_id || self.event_id
end
end
