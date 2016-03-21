class NotifyObserver < ActiveRecord::Base
  attr_accessible :name
  
  has_many :notify_observer_properties, :dependent => :destroy
  
  validates :name, :presence => true
end
