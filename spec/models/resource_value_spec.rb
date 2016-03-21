require 'spec_helper'

describe ResourceValue do
  let(:resource_value) { create(:resource_value) }  

  subject { resource_value }

  it { should respond_to(:field_id) }
  it { should respond_to(:resource_id) }
  it { should respond_to(:value) }
  it { should respond_to(:resource_reference_id) }

  it { should be_valid }

  describe "when resource_id is not present" do
    before { resource_value.resource_id = nil }
    it { should_not be_valid }
  end

  describe "#custom_validation" do
    it "should raise error" do
      validator = Validator.create(
        name: "More than 1", 
        body: "@@ > 1", 
        message: "It is less or equal to one!"
      )
      rt = ResourceType.create name: "new resource type"
      resource = Resource.create resource_type_id: rt.id
      field = Field.create field_type_id: 1, name: "new field", resource_type_id: rt.id
      FieldValidation.create field_id: field.id, validator_id: validator.id
      expect do
        rv = ResourceValue.create!(
          resource_id: resource.id,
          field_id: field.id,
          value: "0"
        )
      end.to raise_error ActiveRecord::RecordInvalid
    end

    it "should not raise error" do
      validator = Validator.create(
        name: "More than 1", 
        body: "@@ > 1", 
        message: "It is less or equal to one!"
      )
      rt = ResourceType.create name: "new resource type"
      resource = Resource.create resource_type_id: rt.id
      field = Field.create field_type_id: 1, name: "new field", resource_type_id: rt.id
      FieldValidation.create field_id: field.id, validator_id: validator.id
      expect do
        rv = ResourceValue.create!(
          resource_id: resource.id,
          field_id: field.id,
          value: "5"
        )
      end.not_to raise_error
    end
  end

  
end