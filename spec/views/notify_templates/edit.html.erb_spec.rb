require 'spec_helper'

describe "notify_templates/edit", type: :view do
  before(:each) do
    @notify_template = assign(:notify_template, stub_model(NotifyTemplate,
      :notify_ttemplate_name => "MyString",
      :body => "MyString",
      :desc => "MyString"
    ))
  end

  it "renders the edit notify_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notify_template_path(@notify_template), "post" do
      assert_select "input#notify_template_notify_template_name[name=?]", "notify_template[notify_template_name]"
      assert_select "textarea#notify_template_body[name=?]", "notify_template[body]"
      assert_select "textarea#notify_template_desc[name=?]", "notify_template[desc]"
    end
  end
end
