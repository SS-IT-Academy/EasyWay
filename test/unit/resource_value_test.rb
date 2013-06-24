require 'test_helper'

class ResourceValueTest < ActiveSupport::TestCase
   test "Resource_values validation" do
     value = resource_values(:one)
     assert value.valid?, "Value don't add"
   end
end
