require 'spec_helper'

describe "notify_events/new" do
  before(:each) do
    assign(:notify_event, stub_model(NotifyEvent,
      :event_id => 1,
      :name => "MyString",
      :observer_id => 1,
      :template_id => 1
    ).as_new_record)
  end

  it "renders new notify_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notify_events_path, "post" do
      assert_select "input#notify_event_event_id[name=?]", "notify_event[event_id]"
      assert_select "input#notify_event_name[name=?]", "notify_event[name]"
      assert_select "input#notify_event_observer_id[name=?]", "notify_event[observer_id]"
      assert_select "input#notify_event_template_id[name=?]", "notify_event[template_id]"
    end
  end
end
