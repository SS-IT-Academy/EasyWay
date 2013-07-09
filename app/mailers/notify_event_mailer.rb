require 'user.rb'
class NotifyEventMailer < ActionMailer::Base
  default from: "easyway087@gmail.com"
  
  def notify_event_email(recipient)
   # puts User.find(recipient.user_id)
   # mail :subject => "event created!", :to => Users.find(@recipient.user_id)[0].email
  end
end
