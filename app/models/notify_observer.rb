class NotifyObserver < ActiveRecord::Base
  attr_accessible :name
  validates :name, :presence => true
  has_many :eventproperties
end
