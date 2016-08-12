require "spec_helper"

describe NotifyObserver do
  it "is invalid without named" do
    notify_observer = NotifyObserver.new
    notify_observer.save
    expect(notify_observer).to_not be_valid
  end
  
  it "is valid with a name" do
    notify_observer = NotifyObserver.new(
      name: 'UserObserver')
    notify_observer.save
    expect(notify_observer).to be_valid
  end
end