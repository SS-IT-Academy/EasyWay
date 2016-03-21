require 'spec_helper'

describe "notify_templates/show" do
  before(:each) do
    @notify_template = assign(:notify_template, stub_model(NotifyTemplate,
      :template_name => "Template Name",
      :body => "Body",
      :desc => "Desc"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Template Name/)
    rendered.should match(/Body/)
    rendered.should match(/Desc/)
  end
end
