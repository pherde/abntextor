class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_referer, only: [:new, :edit]
  before_action :configure_devise_params, if: :devise_controller?
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
  def set_referer
  	session[:referer] = request.referer
  end

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :alias, :email, :college, :password, :password_confirmation) }
  end
end
