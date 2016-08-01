require 'spec_helper'

describe 'resources/index', type: :view, ability_stubbed: true do
  before(:each) do
    resource_type = stub_model(ResourceType, id: 1, name: 'Some name')
    @resources = [1, 2].map do |id| 
      stub_model(Resource, description: "Description #{id}", 
                 resource_type_id: resource_type.id,
                 resource_type: resource_type 
                )
    end
    assign(:resources, @resources)
    assign(:resource_types, [resource_type])
  end

  it 'renders a list of resources' do
    @ability.can :read, @resources.first

    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'tr>td', :text => 'Description 1'.to_s, :count => 1
    assert_select 'tr>td', :text => 'Description 2'.to_s, :count => 0
    assert_select 'tr>td', :text => 'Some name'.to_s, :count => 1
  end
end
