class UsersController < ApplicationController
  require 'mini_magick'

  def index
    redirect_to login_path unless logged_in?
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.created_articles.ordered_by_most_recent
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        avatar = params[:user][:avatar]
        mini_image = MiniMagick::Image.new(avatar.tempfile.path)
        mini_image.resize '256x256'
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
