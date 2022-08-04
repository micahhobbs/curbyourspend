class ProfilesController < ApplicationController
  def index
    @search = params[:search]
    @users = User.where(profile_visible: "true")
    if @search.present?
      @name = @search["name"]
      sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
      @users = User.where(sql_query, query: "%#{@name}%")
    end
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
