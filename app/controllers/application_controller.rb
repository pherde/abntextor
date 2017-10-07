class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user

  private
    def set_user
    	@user = User.find(1)
    end
end
