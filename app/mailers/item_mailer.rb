class ItemMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.item_mailer.notify.subject
  #
  def notify(user, items)
    @user = user
    @items = items
    p "in notify"
    mail(to: @user.email, subject: "Your Item is Ready for Review")
    p "Mail to #{@user.email} has been sent"
  end
end
