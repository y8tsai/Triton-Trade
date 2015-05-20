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
  private
  def user_params
    params.require(:user).permit(:name, :provider, :uid, :email);
  end

end
