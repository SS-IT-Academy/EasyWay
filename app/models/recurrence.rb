class Recurrence < ActiveRecord::Base
  attr_accessible :days_of_month, :days_of_week, :days_of_year, :end_date, :start_date
  has_many :Events
  validates :end_date, :start_date, :presence => true
end
