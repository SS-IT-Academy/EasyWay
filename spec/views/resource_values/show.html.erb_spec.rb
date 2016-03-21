require 'spec_helper'

describe "resource_values/show" do
  before(:each) do
    @resource_value = assign(:resource_value, stub_model(ResourceValue,
      :field_id => 1,
      :resource_id => 2,
      :resource_reference_id => 3,
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Value/)
  end
end
