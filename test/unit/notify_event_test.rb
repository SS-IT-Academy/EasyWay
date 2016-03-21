require 'test_helper'

class NotifyEventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "NotifyEvent name must be present validation" do
   # notifyevent = NotifyEvent.new(name: "name")
    notifyevent = notify_events(:one)
    assert notifyevent.valid? "Any field attribute cann't be blank"
  end
end
