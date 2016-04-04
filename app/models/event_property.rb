class EventProperty < ActiveRecord::Base
  belongs_to :notifyobserver
  attr_accessible :name
end
