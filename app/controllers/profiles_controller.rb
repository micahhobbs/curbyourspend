class ProfilesController < ApplicationController
  def index
    @users = User.where(profile_visible: "true")
  end

  def show
    @user = User.find(params[:id])
  end
end
