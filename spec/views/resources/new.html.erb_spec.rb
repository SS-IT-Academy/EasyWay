require 'spec_helper'

describe "resources/new", type: :view do
  before(:each) do
    assign(:resource, stub_model(Resource,
      description: "MyString",
      resource_type_id: 1
    ).as_new_record)
    assign(:resource_types, [stub_model(ResourceType,
      id: 1,
      name: 'Some name'
    )])
  end

  it "renders new resource form" do
    render

    assert_select "form[action=?][method=?]", resources_path, "post" do
      assert_select "select#resource_resource_type_id[name=?]", "resource[resource_type_id]"
    end
  end
end
