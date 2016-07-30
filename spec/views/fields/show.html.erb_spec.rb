require 'spec_helper'

describe 'fields/show', type: :view do
  before(:each) do
    field_type = stub_model(FieldType,
      id: 1,
      name: 'Field Type Name'
    )
    resource_type = stub_model(ResourceType,
      id: 2,
      name: 'Resource Type'
    )
    @field = assign(:field, stub_model(Field,
      name: 'Name',
      field_type_id: field_type.id,
      resource_type_id: resource_type.id,
      field_type: field_type,
      resource_type: resource_type
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Resource Type/)
    rendered.should match(/Field Type Name/)
  end
end
