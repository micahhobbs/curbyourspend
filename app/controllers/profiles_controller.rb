class ProfilesController < ApplicationController
  def index
    @users = User.where(profile_visible: "true")
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
    @value = 0
    @items.each do |item|
      if item.status == nil # TODO update when status set in model
        @value += item.value
      end
    end
  end
end
