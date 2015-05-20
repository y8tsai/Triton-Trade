class UsersController < ApplicationController

  def index
    @users= User.all
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: params[:id])
  end

  def create
    User.create(user_params)
  end

  def update
  end

  def destroy
    User.find(params[:id]).destroy
  end

  def promote
    User.find(params[:id]).update_attribute :admin, true
  end

  def demote
    User.find(params[:id]).update_attribute :admin, false
  end

  private
  def user_params
    params.require(:user).permit(:name, :provider, :uid, :email);
  end

end
