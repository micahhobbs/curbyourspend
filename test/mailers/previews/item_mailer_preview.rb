# Preview all emails at http://localhost:3000/rails/mailers/item_mailer
class ItemMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/item_mailer/notify
  def notify
    ItemMailer.notify
  end

end
