class Event < ActionContoller::Base
  attr_accessor :duration, :started_at
  def intialize(duration, started_at)
    @duration = duration
    @started_at = started_at
  end
end