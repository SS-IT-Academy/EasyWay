require 'spec_helper'

describe Resource do
  let(:resource) { create :resource }
  
  subject { resource }

  it { should respond_to(:description) }
  it { should respond_to(:resource_type_id) }
  it { should respond_to(:resource_type) }
  it { should respond_to(:resource_values) }
  it { should respond_to(:event_resources) }
  it { should respond_to(:permission_roles) }

  it { should be_valid }

  describe "when resource_type_id is not present" do
    before { resource.resource_type_id = nil }
    it { should_not be_valid }
  end

  describe "resource values association" do
    it "should destroy associated resource values" do
      resource_values = resource.resource_values
      resource.destroy
      resource_values.should be_empty
    end
  end

  describe "#all_value_ids" do
    it "should return array with all ids without resource_reference_id" do
      3.times do |i|
        create :field
        resource.resource_values.create field_id: i + 1, value: "some#{i}"
      end
      create :field
      resource2 = create :resource
      resource2.resource_values.create field_id: 4, resource_reference_id: resource.id
      resource2.all_value_ids.should == [1, 2, 3]
    end
  end

  describe "#eval_description" do
    it "makes description match to the pattern" do
      resource_type = create :resource_type
      resource2 = create :resource, resource_type_id: resource_type.id
      3.times do |i|
        resource_type.fields.create field_type_id: i + 1, name: "some#{i}"
        resource2.resource_values.create field_id: resource_type.fields[i].id, value: "value#{i}"
      end
      resource_type.update_attribute :description, "$${some0} description"
      resource2.eval_description.should == "value0 description"
    end
  end 

  describe ".resource_fields_with_values_by_resource" do
    it "returns resource values array with resource reference id" do
      resource_type = create :resource_type
      resource2 = create :resource, resource_type_id: resource_type.id
      3.times do |i|
        resource_type.fields.create field_type_id: i + 1, name: "some#{i}"
        resource2.resource_values.create field_id: resource_type.fields[i].id, value: "value#{i}"
      end
      Resource.resource_fields_with_values_by_resource(resource2.id).class.should == ActiveRecord::Relation
    end
  end

  describe ".resources_by_event" do
    it "returns resource values array with resource reference id" do
      event = create :event, start_at: "10:10", end_at: "12:00"
      # p Resource.resources_by_event(event.id)
    end
  end
end
