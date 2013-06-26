require 'spec_helper'

describe "table_headers/edit" do
  before(:each) do
    @table_header = assign(:table_header, stub_model(TableHeader,
      :resource_type_id => 1,
      :table_template_id => 1,
      :orientation => "MyString",
      :position_num => 1,
      :parent_id => 1
    ))
  end

  it "renders the edit table_header form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", table_header_path(@table_header), "post" do
      assert_select "input#table_header_resource_type_id[name=?]", "table_header[resource_type_id]"
      assert_select "input#table_header_table_template_id[name=?]", "table_header[table_template_id]"
      assert_select "input#table_header_orientation[name=?]", "table_header[orientation]"
      assert_select "input#table_header_position_num[name=?]", "table_header[position_num]"
      assert_select "input#table_header_parent_id[name=?]", "table_header[parent_id]"
    end
  end
end
