require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get businesses" do
    get :businesses
    assert_response :success
  end

end
