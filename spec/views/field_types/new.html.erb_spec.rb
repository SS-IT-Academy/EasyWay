require 'spec_helper'

describe "field_types/new" do
  before(:each) do
    assign(:field_type, stub_model(FieldType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new field_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", field_types_path, "post" do
      assert_select "input#field_type_name[name=?]", "field_type[name]"
    end
  end
end
