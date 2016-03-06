class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_strong_params, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_strong_params
    devise_parameter_sanitizer.for(:sign_up) do |user_params|
      user_params.permit({ roles: [] }, :name, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.for(:account_update) do |user_params|
      user_params.permit({ roles: [] }, :name, :email, :password, :password_confirmation)
    end
  end
end
