class NotifyEventObserver < ActiveRecord::Observer
  def after_create(notify_event)
    NotifyEventMailer.deliver_notify_event_email(notify_event)
  end
end
