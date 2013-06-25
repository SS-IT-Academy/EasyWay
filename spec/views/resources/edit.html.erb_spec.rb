require 'spec_helper'

describe "resources/edit" do
  before(:each) do
    @resource = assign(:resource, stub_model(Resource,
      :description => "MyString",
      :resource_type_id => 1
    ))
  end

  it "renders the edit resource form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resource_path(@resource), "post" do
      assert_select "input#resource_description[name=?]", "resource[description]"
      assert_select "input#resource_resource_type_id[name=?]", "resource[resource_type_id]"
    end
  end
end
