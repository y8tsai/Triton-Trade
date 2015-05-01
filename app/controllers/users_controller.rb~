# change this later
class UsersController < ActionController::Base
  def create
    User.create(user_params)
  end
  private
  def user_params
    params.require(:user).permit(:name, :provider, :uid, :email);
  end
end
