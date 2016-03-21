require 'spec_helper'

describe "resource_types/new" do
  before(:each) do
    assign(:resource_type, stub_model(ResourceType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new resource_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", resource_types_path, "post" do
      assert_select "input#resource_type_name[name=?]", "resource_type[name]"
    end
  end
end
