require 'spec_helper'

describe "field_types/index" do
  before(:each) do
    assign(:field_types, [
      stub_model(FieldType,
        :name => "Name"
      ),
      stub_model(FieldType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of field_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
