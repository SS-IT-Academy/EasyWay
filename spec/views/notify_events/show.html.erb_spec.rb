require 'spec_helper'

describe 'notify_events/show', type: :view do
  before(:each) do
    @notify_event = assign(:notify_event, stub_model(NotifyEvent,
      event_id: 1,
      name: 'Name',
      notify_observer_id: 2,
      notify_template_id: 3
    ))
  end

  it 'renders attributes in <p>' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
