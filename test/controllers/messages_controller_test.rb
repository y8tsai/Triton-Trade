require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create welcome message" do
    user1 = User.new(name: "Richard", email: "xxxx@ucsd.edu")
    user1.save
    msg = Message.find_by(recipient_id: user1.id)
    assert_equal("Hello, Richard!", msg.subject)
    msg.destroy
    user1.destroy
  end
end
