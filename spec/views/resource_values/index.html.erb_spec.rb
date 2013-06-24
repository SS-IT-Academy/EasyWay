require 'spec_helper'

describe "resource_values/index" do
  before(:each) do
    assign(:resource_values, [
      stub_model(ResourceValue,
        :field_id => 1,
        :resource_id => 2,
        :resource_reference_id => 3,
        :value => "Value"
      ),
      stub_model(ResourceValue,
        :field_id => 1,
        :resource_id => 2,
        :resource_reference_id => 3,
        :value => "Value"
      )
    ])
  end

  it "renders a list of resource_values" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
