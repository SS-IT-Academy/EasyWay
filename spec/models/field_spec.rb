require 'spec_helper'

describe Field do
  let(:field_type) { create(:field_type) }
  let(:resource_type) { create(:resource_type) }
  let(:field) { create(:field, field_type_id: field_type.id, resource_type_id: resource_type.id) }

  subject { field }

  it { should respond_to(:field_type_id) }
  it { should respond_to(:name) }
  it { should respond_to(:resource_type_id) }
  it { should respond_to(:resource_type_reference_id) }
  it { should respond_to(:resource_values) }
  it { should respond_to(:validators) }
  it { should respond_to(:field_validations) }

  it { should be_valid }

  describe "when resource_type_id is not present" do
    before { field.resource_type_id = nil }
    it { should_not be_valid }
  end

  describe "when field_type_id is not present" do
    before { field.field_type_id = nil }
    it { should_not be_valid }
  end
  
  describe "when name is not present" do
    before { field.name = nil }
    it { should_not be_valid }
  end

  describe "resource values association" do
    it "should destroy associated resource values" do
      resource_values = field.resource_values
      field.destroy
      resource_values.should be_empty
    end
  end
end