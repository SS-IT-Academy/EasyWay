class Event < ActiveRecord::Base
  attr_accessible :name
  has_many :notify_events
end
