#*/5 * * * * "linx http://easyway/cron/"
class Cron < ApplicationController
  def index
    emailsender = Emailsender.new()
    events = Event.all()
  
#    for event in events
#      for receiver in event.attendees   
#          message = ReminderMessageBuilder.new().setEvent(event).setReceiver().get()
#          emailsender.send(message)
#      
  end
  
end