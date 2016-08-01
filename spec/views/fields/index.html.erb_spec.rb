require 'spec_helper'

describe 'fields/index', type: :view do
  before(:each) do
    field_type = stub_model(FieldType,
      id: 1,
      name: 'Field Type Name'
    )
    resource_type = stub_model(ResourceType,
      id: 2,
      name: 'Resource Type'
    )
    @field = assign(:fields, [stub_model(Field,
      name: 'Name',
      field_type_id: field_type.id,
      resource_type_id: resource_type.id,
      field_type: field_type,
      resource_type: resource_type
    )])    
  end

  it 'renders a list of fields' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 'Name', :count => 1
    assert_select "tr>td", :text => 'Resource Type', :count => 1
    assert_select "tr>td", :text => 'Field Type Name', :count => 1
  end
end
