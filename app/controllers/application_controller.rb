class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  def index
    @updates = ProgressUpdate.order("created_at DESC")
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  protected

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password,
    :password_confirmation, :remember_me, :avatar, :avatar_cache, :remove_avatar) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :about, :password,
    :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }

  end
  
end
