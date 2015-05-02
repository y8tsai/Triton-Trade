class UsersController < ActionController::Base

  def index
     @users= User.all
  end

  def show
     @users = User.find(params[:id])
  end

  def create
    User.create(user_params)
  end
  private
  def user_params
    params.require(:user).permit(:name, :provider, :uid, :email);
  end

end
