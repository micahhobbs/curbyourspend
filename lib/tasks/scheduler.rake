namespace :scheduler do
  desc "Send Notification on Items"
  task items_notification: :environment do
    User.notify_all_users
  end
end

# desc "This task is called by the Heroku scheduler add-on"

# task :items_notification => :environment do
#   User.notify_all_users
# end
