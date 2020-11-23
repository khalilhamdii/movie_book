class SessionsController < ApplicationController
  def index
    redirect_to login_path
  end

  def new; end

  def create
    user = User.find_by_email(params[:email])
    if user
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Email is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
