require 'rufus/scheduler'


scheduler = Rufus::Scheduler.new



# scheduler.every '1s' do
#   puts 'check blood pressure'
# end



scheduler.cron '10  12 * * 1-5' do
  #puts "Sending Daily Standup Email"
  #Notification.standup_notify.deliver
  #puts "Mail successfully sent"
end