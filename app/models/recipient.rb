class Recipient < ActiveRecord::Base
  attr_accessor :notifyevent, :user
  def initialize(n, u)
    @notifyevent= n
    @user = u

  end

  def to_s
    "recipient"
  end
end

