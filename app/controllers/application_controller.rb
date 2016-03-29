class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_strong_params, if: :devise_controller?
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |exception|
	redirect_to root_url, alert: exception.message
end

def cors_set_access_control_headers
  headers['Access-Control-Allow-Origin'] = '*'
  headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
  headers['Access-Control-Max-Age'] = "1728000"
end

def cors_preflight_check
  if request.method == :options
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
    headers['Access-Control-Max-Age'] = '1728000'
    render :text => '', :content_type => 'text/plain'
  end
end

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
