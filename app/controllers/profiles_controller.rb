class ProfilesController < ApplicationController
  def index
    @users = User.where(profile_visible: "true")
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
    @total_value_saved = 0
    @total_items_adandoned_count = 0
    @items.each do |item|
      if item.status == "Abandoned"
        @total_value_saved += item.value
        @total_items_adandoned_count += 1
      end
    end
  end
end
