require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
     @item = Item.new
  end

  test "Create Item" do
    get :create
    assert_response :success
  end

  test "New Item" do
    get :new
    assert_response :success
  end

  test "Show Item" do
    get :show, id: @item.id
    assert_response :success
  end

  test "Update Item" do
    get :update
    assert_response :success
  end

  test "Index Item" do
    get :index
    assert_response :success
  end

  test "Destroy Item" do
    get :destroy, id: @item.id
    assert_response :success
  end
end
