namespace :batch do
  desc "Send Notification on Items"
  task items_notification: :environment do
    Item.send_emails
  end
end
