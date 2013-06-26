require 'spec_helper'

describe "table_headers/show" do
  before(:each) do
    @table_header = assign(:table_header, stub_model(TableHeader,
      :resource_type_id => 1,
      :table_template_id => 2,
      :orientation => "Orientation",
      :position_num => 3,
      :parent_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Orientation/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
