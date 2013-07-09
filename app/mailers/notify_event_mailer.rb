require 'user.rb'
class NotifyEventMailer < ActionMailer::Base
  default from: "easyway087@gmail.com"
  
  def notify_event_email
  
   mail :subject => "Event created!", :to => "svisigor@ukr.net"
  end
end
