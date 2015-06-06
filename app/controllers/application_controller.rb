class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_search
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def set_search
    @search = Search.new
  end

    protected

    	def configure_permitted_parameters
             devise_parameter_sanitizer.for(:sign_up) do |u| 
		u.permit :name, :email, :password 
	     end

             devise_parameter_sanitizer.for(:account_update) do |u| 
u.permit :name, :email, :password, :current_password, :PID, :date_of_birth, :is_female, :avatar_url 
    	     end  
	end
end
