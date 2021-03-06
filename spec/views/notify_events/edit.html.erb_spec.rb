require 'spec_helper'

describe 'notify_events/edit', type: :view do
  before(:each) do
    @notify_event = assign(:notify_event, stub_model(NotifyEvent,
      event_id: 1,
      name: 'MyString',
      observer_id: 1,
      template_id: 1
    ))
  end

  it 'renders the edit notify_event form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', notify_event_path(@notify_event), 'post' do
      assert_select 'input#notify_event_name[name=?]', 'notify_event[name]'
      assert_select 'select#notify_event_notify_observer_id[name=?]', 'notify_event[notify_observer_id]'
      assert_select 'select#notify_event_notify_template_id[name=?]', 'notify_event[notify_template_id]'
    end
  end
end
