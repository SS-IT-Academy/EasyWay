require 'spec_helper'

describe ResourceType do
  let(:resource) { create :resource }
  
  subject { resource }

  it { should respond_to(:description) }
  it { should respond_to(:resource_type_id) }
  it { should respond_to(:resource_values) }
  it { should respond_to(:event_resources) }
  it { should respond_to(:permission_roles) }
  it { should respond_to(:by_resource_type) }

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
end
