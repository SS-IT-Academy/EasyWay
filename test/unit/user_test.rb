require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User validation" do
    user = users(:one)
    user.username = nil    
    assert !user.valid?, "Save user with blank username"
    user = users(:one)
    user.username = "admin"
    user.email = nil
    assert !user.valid?, "User with blank email saved!"
  end
end
