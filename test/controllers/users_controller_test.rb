require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
     @user = User.new
  end

  test "Create User" do
    get :create
    assert_response :success
  end

  test "New User" do
    get :new
    assert_response :success
  end

  test "Show User" do
    get :show, id: @user.id
    assert_response :success
  end

  test "Update User" do
    get :update
    assert_response :success
  end

  test "Index User" do
    get :index
    assert_response :success
  end

  test "Destroy User" do
    get :destroy, id: @user.id
    assert_response :success
  end
end
