require 'spec_helper'

describe NotifyEvent do
  
  it "is invalid without a name" do
  notify_event = NotifyEvent.new
  notify_event.should_not be_valid
  end
  
  it "is invalid without a template_id" do
  notify_event = NotifyEvent.new
  notify_event.should_not be_valid
  end
  
  it "is invalid without a observer_id || event_id" do
  notify_event = NotifyEvent.new
  notify_event.should_not be_valid
  end
end