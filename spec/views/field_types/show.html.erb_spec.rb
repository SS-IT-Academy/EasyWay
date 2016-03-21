require 'spec_helper'

describe "field_types/show" do
  before(:each) do
    @field_type = assign(:field_type, stub_model(FieldType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
