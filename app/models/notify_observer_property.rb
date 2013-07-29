class NotifyObserverProperty < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :notify_observer
  has_many :mappings
  
  validates :name, :presence => true
  
end
