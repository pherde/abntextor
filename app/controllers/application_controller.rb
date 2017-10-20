class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_referer, only: [:new, :edit]
  protect_from_forgery with: :exception

  private
  def set_referer
  	session[:referer] = request.referer
  end
end
