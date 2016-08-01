require 'spec_helper'

describe 'resources/show', type: :view do
  before(:each) do
    resource_type = stub_model(ResourceType,
      id: 1, 
      name: 'Some Name'
    )
    @resource = assign(:resource, stub_model(Resource,
      description: 'Description',
      resource_type_id: 1,
      resource_type: resource_type
    ))
    assign(:resource_type, resource_type)
    assign(:field_types, [])
  end

  it 'renders attributes in <p>' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/1/)
  end
end
