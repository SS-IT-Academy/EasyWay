# class NotifyEventMailer < ActionMailer::Base
#   default :from => "easyway087@gmail.com"
  
#   def notify_event_email(notify_event)
#     @notify_event = notify_event
#     @recipients = user.email
#     @url = 'http://localhost:3000/sign_in'
#     attachments.inline['logo1.png'] = File.read('app/assets/images/logo1.png')
#     mail :subject => "Event created!", :to => @user.email
  
#   end
# end
