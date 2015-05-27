class UsersController < ApplicationController

  def index
    @users= User.all
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: params[:id])
    @purchaseditems = Item.where(buyeremail: params[:id])
  end

  def create
    User.create(user_params)
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
