require 'spec_helper'

describe "table_headers/index" do
  before(:each) do
    assign(:table_headers, [
      stub_model(TableHeader,
        :resource_type_id => 1,
        :table_template_id => 2,
        :orientation => "Orientation",
        :position_num => 3,
        :parent_id => 4
      ),
      stub_model(TableHeader,
        :resource_type_id => 1,
        :table_template_id => 2,
        :orientation => "Orientation",
        :position_num => 3,
        :parent_id => 4
      )
    ])
  end

  it "renders a list of table_headers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Orientation".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
