require 'test_helper'

class AdminControllerTest < ActionController::TestCase

  test "index" do
    get :index
    assert_response :success
  end

end
