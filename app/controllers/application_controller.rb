class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  

  protected


    def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,:last_name, :email, :password) }
	   devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:first_name, :last_name, :email, :password, :remember_me) }
	   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name,:last_name, :email, :password, :password_confirmation,:reset_password_token,:current_password) }
	end
end
