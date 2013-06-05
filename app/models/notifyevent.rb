class NotifyEvent < ActiveRecord::Base
  attr_accessor :event, :template, :scheduler
  def initialize(e, t, s)
    @event = e
    @template = t
    @scheduler = s

  end
  
  def to_s
    "notify event"
  end
end

