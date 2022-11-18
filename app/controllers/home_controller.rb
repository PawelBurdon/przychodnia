class HomeController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def users
    @users = User.all
  end

  def info
    @users = User.all
    @user = current_user
  end

  def destroy
    @users = User.find(params[:id])
    @users.destroy

    redirect_to home_users_path
  end
end