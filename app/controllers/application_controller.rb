class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Uncomment this line to require authentication for all pages
  before_action :update_allowed_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    root_path
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :password) }
  end
end
