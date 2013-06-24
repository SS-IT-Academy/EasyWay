require 'spec_helper'

describe "fields/show" do
  before(:each) do
    @field = assign(:field, stub_model(Field,
      :name => "Name",
      :field_type_id => 1,
      :resource_type_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
