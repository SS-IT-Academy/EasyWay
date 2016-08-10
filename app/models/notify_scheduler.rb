class NotifyScheduler < ActiveRecord::Base
  attr_accessible :end_at, :period, :start_at

  validates :period, :start_at, :end_at, presence: true
  validate :date_validation

  def date_validation
    if start_at && start_at < Time.now
      errors.add(:start_at, "can't be less than time is now" )
    end

    if start_at && start_at > end_at
      errors.add(:end_at, "can't be less than start_at" )
    end
  end
end
