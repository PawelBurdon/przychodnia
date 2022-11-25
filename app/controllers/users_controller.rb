class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
 
    redirect_to users_path
  end

  def appointment
    @user = current_user
    @clinic = Clinic.where(user_id: @user.id)
  end
  def doctors
    @doctor = current_user
    if current_user.id == 3
      current_user.id = 1
    end
    @clinic = Clinic.where("doctor_id = ?", current_user.id)
  end
end
