require 'spec_helper'

describe "resource_values/edit" do
  before(:each) do
    @resource_value = assign(:resource_value, stub_model(ResourceValue,
      :field_id => 1,
      :resource_id => 1,
      :resource_reference_id => 1,
      :value => "MyString"
    ))
  end

  it "renders the edit resource_value form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resource_value_path(@resource_value), "post" do
      assert_select "input#resource_value_field_id[name=?]", "resource_value[field_id]"
      assert_select "input#resource_value_resource_id[name=?]", "resource_value[resource_id]"
      assert_select "input#resource_value_resource_reference_id[name=?]", "resource_value[resource_reference_id]"
      assert_select "input#resource_value_value[name=?]", "resource_value[value]"
    end
  end
end
