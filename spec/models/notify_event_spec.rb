require 'spec_helper'

describe NotifyEvent do
  it "is invalid without a name" do
  expect(NotifyEvent.new(:name => nil)).to have(1).errors_on(:name)
  end
  
  it "is invalid without a event_id" do
  expect(NotifyEvent.new(:event_id => nil)).to have(1).errors_on(:event_id)
  end
  
  it "is invalid without a template_id" do
  expect(NotifyEvent.new(:template_id => nil)).to have(1).errors_on(:template_id)
  end
end