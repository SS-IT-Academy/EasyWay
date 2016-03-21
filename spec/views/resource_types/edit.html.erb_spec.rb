require 'spec_helper'

describe "resource_types/edit" do
  before(:each) do
    @resource_type = assign(:resource_type, stub_model(ResourceType,
      :name => "MyString"
    ))
  end

  it "renders the edit resource_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resource_type_path(@resource_type), "post" do
      assert_select "input#resource_type_name[name=?]", "resource_type[name]"
    end
  end
end
