class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    ready_items
  end

  def dashboard
  end

  def ready_items
    if user_signed_in?
      current_user.items.each do |item|
        if item.end_date == Date.today
          ItemNotification.with(item: item, message: "#{item.name} is ready to review.").deliver(item.user)
        end
      end
    end
  end

  def calendar
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date

    # For a monthly view:
    @items = Item.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def email_test
    current_user.notify
    redirect_back(fallback_location: root_path)
  end
end
