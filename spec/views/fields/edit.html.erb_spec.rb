require 'spec_helper'

describe "fields/edit" do
  before(:each) do
    @field = assign(:field, stub_model(Field,
      :name => "MyString",
      :field_type_id => 1,
      :resource_type_id => 1
    ))
  end

  it "renders the edit field form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", field_path(@field), "post" do
      assert_select "input#field_name[name=?]", "field[name]"
      assert_select "input#field_field_type_id[name=?]", "field[field_type_id]"
      assert_select "input#field_resource_type_id[name=?]", "field[resource_type_id]"
    end
  end
end
