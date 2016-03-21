require 'spec_helper'

describe "resource_values/new" do
  before(:each) do
    assign(:resource_value, stub_model(ResourceValue,
      :field_id => 1,
      :resource_id => 1,
      :resource_reference_id => 1,
      :value => "MyString"
    ).as_new_record)
  end

  it "renders new resource_value form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resource_values_path, "post" do
      assert_select "input#resource_value_field_id[name=?]", "resource_value[field_id]"
      assert_select "input#resource_value_resource_id[name=?]", "resource_value[resource_id]"
      assert_select "input#resource_value_resource_reference_id[name=?]", "resource_value[resource_reference_id]"
      assert_select "input#resource_value_value[name=?]", "resource_value[value]"
    end
  end
end
