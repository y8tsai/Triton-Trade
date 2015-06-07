require 'test_helper'

class ClaimsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Should successfully claim item" do
  @item = Item.new
  @user = User.new
  @user2 = User.new
  @message = Message.new

  @user2.email = "xxxx@ucsd.edu"
  assert_equal("xxxx@ucsd.edu", @user2.email, "Buyer email matches")
 
  @item.user.id = @user.id
  assert_equal(@item.user.id, @user.id, "Seller id match")
  assert_equal(false, @item.is_sold, "Item is not yet sold")

  @item.is_sold = true
  assert_equal(true, @item.is_sold, "Item has been sold")

  @item.buyer_email = @user2.email
  assert_equal("xxxx@ucsd.edu", @user2.email, "Buyer email match")

  @message.recipient_id = @user.id
  assert_equal( @message.recipient_id, @user.id, "Seller id match")
  
  @item.destroy
  @user.destroy
  @user2.destroy
  @message.destroy
  end  

end
