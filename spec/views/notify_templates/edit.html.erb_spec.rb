require 'spec_helper'

describe "notify_templates/edit" do
  before(:each) do
    @notify_template = assign(:notify_template, stub_model(NotifyTemplate,
      :template_name => "MyString",
      :body => "MyString",
      :desc => "MyString"
    ))
  end

  it "renders the edit notify_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notify_template_path(@notify_template), "post" do
      assert_select "input#notify_template_template_name[name=?]", "notify_template[template_name]"
      assert_select "input#notify_template_body[name=?]", "notify_template[body]"
      assert_select "input#notify_template_desc[name=?]", "notify_template[desc]"
    end
  end
end
