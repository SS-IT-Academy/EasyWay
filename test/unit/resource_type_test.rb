require 'test_helper'

class ResourceTypeTest < ActiveSupport::TestCase
   test "Resource_type validation" do
     resource_type = resource_types(:one)
     assert resource_type.valid?, "resource type with this name already is"
   end
end
