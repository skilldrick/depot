require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "authenticate" do
    dave = users(:dave)
    assert User.authenticate(dave.name, 'secret')
  end

end
