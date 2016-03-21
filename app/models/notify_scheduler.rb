class NotifyScheduler < ActiveRecord::Base
  attr_accessible :end_at, :period, :start_at
  validates :period, :presence => true
  validates :start_at, :numericality => true
  validates :end_at, :numericality => true
end
