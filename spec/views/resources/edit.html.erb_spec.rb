require 'spec_helper'

describe 'resources/edit', type: :view do
  before(:each) do
    @resource = assign(:resource, stub_model(Resource,
      description: 'MyString',
      resource_type_id: 1
    ))
    assign(:resource_types, [stub_model(ResourceType,
      id: 1,
      name: 'Some name'
    )])    
  end

  it 'renders the edit resource form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form[action=?][method=?]', resource_path(@resource), 'post' do
      assert_select 'select#resource_resource_type_id[name=?]', 'resource[resource_type_id]'
    end
  end
end
