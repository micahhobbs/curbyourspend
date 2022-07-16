class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def calendar
    # Scope your query to the dates being shown:
    start_date = params.fetch(:start_date, Date.today).to_date

    # For a monthly view:
    @items = Item.where(start_date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  def email_test
    current_user.notify
<<<<<<< HEAD
    redirect_back(fallback_location: root_path)
=======
>>>>>>> bc8fc576be562a935dda395df57e574d40524bd1
  end

end
