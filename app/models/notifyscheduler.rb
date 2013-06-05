class NotifyScheduler < ActiveRecord::Base
  attr_accessor :period
  def initialize(p)
    @period = p

  end
end

