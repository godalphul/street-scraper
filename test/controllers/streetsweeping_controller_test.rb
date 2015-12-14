require 'test_helper'

class StreetsweepingControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
