require 'test_helper'

class SteetsControllerTest < ActionController::TestCase
  setup do
    @steet = steets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:steets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create steet" do
    assert_difference('Steet.count') do
      post :create, steet: { name: @steet.name }
    end

    assert_redirected_to steet_path(assigns(:steet))
  end

  test "should show steet" do
    get :show, id: @steet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @steet
    assert_response :success
  end

  test "should update steet" do
    patch :update, id: @steet, steet: { name: @steet.name }
    assert_redirected_to steet_path(assigns(:steet))
  end

  test "should destroy steet" do
    assert_difference('Steet.count', -1) do
      delete :destroy, id: @steet
    end

    assert_redirected_to steets_path
  end
end
