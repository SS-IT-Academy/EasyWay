class NotifyEvent < ActiveRecord::Base
  belongs_to :templates
  belongs_to :events
  attr_accessible :event_id, :name, :observer_id, :template_id
end
