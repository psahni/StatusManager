require 'rufus/scheduler'


scheduler = Rufus::Scheduler.new



# scheduler.every '1s' do
#   puts 'check blood pressure'
# end



scheduler.cron '50  11 * * 1-5' do
  puts "=================================="
  puts "Hey its a time"
  puts Time.now
  puts "=================================="
end