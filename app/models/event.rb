class Event < ActionController::Base
  # :TODO add keys add validation, delete descriptions
  attr_accessor :duration, :started_at
  def intialize(duration, started_at)
    @duration = duration
    @started_at = started_at
  end
end