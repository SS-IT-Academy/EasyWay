class NotifyObserverProperty < ActiveRecord::Base
  belongs_to :notify_observer
  attr_accessible :name
  validates :name, :presence => true
end
