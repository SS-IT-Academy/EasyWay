require 'test_helper'

class FieldTest < ActiveSupport::TestCase
   test "Field validation" do
     field = fields(:one)
     assert field.valid?, "field don't created"
   end
end
