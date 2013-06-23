require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  test "Menu Item test validation" do
    menu_item = menus(:one)
    assert menu_item.valid?, "Some field is blank"
  end
end
