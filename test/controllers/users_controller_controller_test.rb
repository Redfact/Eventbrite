require 'test_helper'

class UsersControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get users_controller_view_url
    assert_response :success
  end

end
