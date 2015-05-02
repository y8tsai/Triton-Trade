class UsersController < ActionController::Base

  def index
     @users= User.all
  end

  def show
     before_filter :authenticate_user!
     @user = User.find(params[:id])
  end

  def create
    User.create(user_params)
  end
  private
  def user_params
    params.require(:user).permit(:name, :provider, :uid, :email);
  end

end
