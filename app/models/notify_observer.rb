class NotifyObserver < ActiveRecord::Base
  has_many :eventproperties
  attr_accessible :name
end
