class UsersController < ApplicationController

  def index
    @users= User.all
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: params[:id])
    @purchaseditems = Item.where(buyeremail: User.find(params[:id]).email )
  end

  def create
    User.create(user_params)

    message = Message.new
    message.user_id = user_params[:id]
    message.recipient_id = user_params[:id]
    message.subject = "Hello, #{user_params[:name]}"
    message.body = "Tutorial"
    message.save
  end

  def update
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to :back
  end

  def promote
    User.find(params[:id]).update_attribute :admin, true
    redirect_to :back
  end

  def demote
    User.find(params[:id]).update_attribute :admin, false
    redirect_to :back
  end

  private
  def user_params
    params.require(:user).permit(:name, :provider, :uid, :email);
  end

end
