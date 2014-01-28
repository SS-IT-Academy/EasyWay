require 'spec_helper'

describe ResourceType do
  let(:resource_type) { create(:resource_type) }
  

  subject { resource_type }

  it { should respond_to(:name) }
  it { should respond_to(:fields) }
  it { should respond_to(:resources) }
  it { should respond_to(:permission_roles) }

  it { should be_valid }

  describe "with blank name" do
    before { resource_type.name = " " }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    it "should raise error" do
      expect do
        ResourceType.create!(name: resource_type.name)
      end.to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe "fields association" do
    it "should destroy associated fields" do
      fields = resource_type.fields
      resource_type.destroy
      fields.should be_empty
    end
  end

  describe "resources association" do
    context "when resources are present" do
      before { resource_type.resources.create(description: "my description") }

      it "should not destroy resource_type" do
        expect do
          resource_type.destroy
        end.to raise_error(ActiveRecord::DeleteRestrictionError)
      end
    end
  end

  # describe "permission roles association" do

  # end

end