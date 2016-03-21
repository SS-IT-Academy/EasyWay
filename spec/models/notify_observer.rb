class NotifyObserver < ActiveRecord::Base
  attr_accessor :name
  
  def initialize
    @name = 'UserObserver'
  end
end
