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

  describe "when field_id is not present" do
    before { resource_value.field_id = nil }
    it { should_not be_valid }
  end
end