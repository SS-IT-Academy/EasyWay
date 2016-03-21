require 'test_helper'

class FieldTypeTest < ActiveSupport::TestCase
   test "Field_type validation" do
     field_type = field_types(:one)
     assert field_type.valid?, "field type with this name already is"
   end
end
