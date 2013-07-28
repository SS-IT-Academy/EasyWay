class NotifyObserverProperty < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
  belongs_to :notify_observer
  has_many :mappings
  
end
