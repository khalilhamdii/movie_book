class ApplicationController < ActionController::Base
  # before_action :require_login
  helper_method :current_user
  helper_method :logged_in?
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def require_login
    unless current_user
      redirect_to login_url
    end
  end
end
