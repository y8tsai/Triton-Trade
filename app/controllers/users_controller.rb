# change this later
class UsersController < ActionController::Base
  def edit
    @profile = current_user.profile
  end 

  def create
    User.create(user_params)
  end
  private
  def user_params
    params.require(:user).permit(:name, :provider, :uid, :email);
  end

end
