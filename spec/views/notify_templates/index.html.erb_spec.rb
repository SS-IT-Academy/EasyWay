require 'spec_helper'

describe "notify_templates/index", type: :view do
  before(:each) do
    assign(:notify_templates, [
      stub_model(NotifyTemplate,
        :notify_template_name => "Template Name 1",
        :body => "Body 1",
        :desc => "Desc 1"
      ),
      stub_model(NotifyTemplate,
        :notify_template_name => "Template Name 2",
        :body => "Body 2",
        :desc => "Desc 2"
      )
    ])
  end

  it "renders a list of notify_templates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    [1, 2].each do |ind|
      assert_select "tr>td", :text => "Template Name #{ind}".to_s, :count => 1
      assert_select "tr>td", :text => "Body #{ind}".to_s, :count => 1
      assert_select "tr>td", :text => "Desc #{ind}".to_s, :count => 1
    end  
  end
end
