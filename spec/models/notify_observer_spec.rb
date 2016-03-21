require "spec_helper"

describe NotifyObserver do
  it "is named UserObserver" do
    notify_observer = NotifyObserver.new
    notify_observer.name.should == 'UserObserver'
  end
  
  it "is valid with a name" do
    notify_observer = NotifyObserver.new(
      name: 'UserObserver')
    expect(contact).to be_valid
  end
end