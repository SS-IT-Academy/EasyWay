require 'spec_helper'

describe "fields/index" do
  before(:each) do
    assign(:fields, [
      stub_model(Field,
        :name => "Name",
        :field_type_id => 1,
        :resource_type_id => 2
      ),
      stub_model(Field,
        :name => "Name",
        :field_type_id => 1,
        :resource_type_id => 2
      )
    ])
  end

  it "renders a list of fields" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
