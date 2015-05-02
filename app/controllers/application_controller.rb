class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 #The following block of code is used to store updated profile information
 #THe data is passed as parameters to the database
 before_filter :configure_permitted_parameters, if: :devise_controller?

     protected

     def configure_permitted_parameters
              devise_parameter_sanitizer.for(:sign_up) { |u| u.permit (:name, :email, :password) }
             devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :PID, :date_of_birth, :is_female) }
     end  
end
