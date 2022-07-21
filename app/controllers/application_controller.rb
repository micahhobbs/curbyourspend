class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  user.items.each do |item|
    if item.end_date == Today.Date
      CommentNotification.with(item: item, message: "#{item.name} is now ready to be reviewed.").deliver(item.user)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :username, :profile_visible, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :username, :profile_visible, :avatar])
  end
end
