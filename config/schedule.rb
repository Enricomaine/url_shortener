# Use this file to easily define all of your cron jobs.
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# Learn more: http://github.com/javan/whenever

every 1.day, at: '2:00 am' do 
  runner "DailyCleanup.perform_now"
end
