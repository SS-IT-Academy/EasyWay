require 'spec_helper'

describe "field_types/edit" do
  before(:each) do
    @field_type = assign(:field_type, stub_model(FieldType,
      :name => "MyString"
    ))
  end

  it "renders the edit field_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", field_type_path(@field_type), "post" do
      assert_select "input#field_type_name[name=?]", "field_type[name]"
    end
  end
end
