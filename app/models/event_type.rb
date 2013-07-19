class EventType < ActiveRecord::Base
  attr_accessible :name
  has_many :Events
  validates :name, :presence => true
end
