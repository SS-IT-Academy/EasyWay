require 'test_helper'

class ResourceTest < ActiveSupport::TestCase
   test "Resource validation" do
     resource = resources(:one)
     assert resource.valid?, "resource don't have type"
   end
end
