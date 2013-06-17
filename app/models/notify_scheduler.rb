class NotifyScheduler < ActiveRecord::Base
  attr_accessible :period, :start_at, :start_end
end
