class UsersController < ApplicationController
  def index
    @users = User.where(profile_visible: "true")
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar)
  end
end
