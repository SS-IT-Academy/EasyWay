require 'spec_helper'

describe "notify_templates/index" do
  before(:each) do
    assign(:notify_templates, [
      stub_model(NotifyTemplate,
        :template_name => "Template Name",
        :body => "Body",
        :desc => "Desc"
      ),
      stub_model(NotifyTemplate,
        :template_name => "Template Name",
        :body => "Body",
        :desc => "Desc"
      )
    ])
  end

  it "renders a list of notify_templates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Template Name".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
    assert_select "tr>td", :text => "Desc".to_s, :count => 2
  end
end
