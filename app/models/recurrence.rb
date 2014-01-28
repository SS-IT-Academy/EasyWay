class Recurrence < ActiveRecord::Base
  attr_accessible :repetition, :end_date, :start_date
  
  has_many :events
  
  validates :end_date, :start_date, :presence => true
end
