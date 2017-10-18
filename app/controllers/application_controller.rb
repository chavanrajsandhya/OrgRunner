class ApplicationController < ActionController::Base
  include Accessible
  before_action :authenticate_user!
  # protect_from_forgery with: :exception

  protect_from_forgery  with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters 
  	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:latitude, :longitude, :email, :address, :password, :password_confirmation, :remember_me) } 
  	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:latitude, :longitude, :address, :email, :password, :remember_me) } 
  	devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :latitude, :longitude, :address, :email, :password, :password_confirmation, :current_password) }
  end

  def after_sign_in_path_for(resource)
    if admin_signed_in?
      drivers_path
    else
      dashboard_index_path
    end
  end

  def after_sign_up_path_for(resource)
    binding.pry
    if user_signed_in?
      new_admin_session_path
    else
      root_path
    end
  end


end
