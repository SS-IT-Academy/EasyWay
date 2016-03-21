require 'test_helper'

class NotifyTemplateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "NotifyTemplate validation"
 # notifytemplate = NotifyTemplates.new(name: "name")
    notifytemplate = notify_templates(:one)
    assert notifytemplate.valid? "Name cann't be blank"
end

