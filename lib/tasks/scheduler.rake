namespace :scheduler do
    desc "This task is called by the Heroku scheduler add-on"
    task :push_line_notification => :environment do
      puts "Sending push notifications..."
      PushLineJob.perform_now
      puts "Done."
    end
  end