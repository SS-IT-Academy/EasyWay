class NotifyObserverProperty < ActiveRecord::Base
  attr_accessible :name, :notify_observer_id
  
  belongs_to :notify_observer
  has_many :mappings
  
  validates :name, :presence => true
end
