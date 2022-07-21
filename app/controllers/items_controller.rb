class ItemsController < ApplicationController

  def index
    @items = Item.order(:value).all
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    @item.status = "Cooling off"
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to items_path
  end

  def buy
    @item = Item.find(params[:item_id])
    @item.status = "Bought"
    @item.save
    redirect_to item_path(@item)
  end

  def abandon
    @item = Item.find(params[:item_id])
    @item.status = "Abandoned"
    @item.save
    redirect_to item_path(@item)
  end

  private

  def email_notification
    User.all.each do |user|
      ItemMailer.with(user: user).notify.deliver_now
    end
  end

  def item_params
    params.require(:item).permit(:name, :value, :photo, :reason, :description, :link, :start_date, :end_date)
  end
end
