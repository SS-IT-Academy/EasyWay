require 'spec_helper'

describe ResourceType do
  let(:resource_type) { create(:resource_type) }  

  subject { resource_type }

  it { should respond_to(:name) }
  it { should respond_to(:fields) }
  it { should respond_to(:resources) }
  it { should respond_to(:permission_roles) }
  it { should respond_to(:fields_resource_values) }

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

  describe "#all_field_ids" do
    it "should return array with all ids without resource_type_reference_id" do
      3.times do |i|
        resource_type.fields.create field_type_id: i + 1, name: "some#{i}"
      end
      resource_type2 = create :resource_type
      resource_type2.fields.create(
        name: "City",
        field_type_id: 7, # complex
        resource_type_reference_id: resource_type.id
      )
      resource_type2.all_field_ids.should == [1, 2, 3]
    end
  end

  describe "#all_field_names" do
    it "should return array with all names without resource_type_reference_id" do
      3.times do |i|
        resource_type.fields.create field_type_id: i + 1, name: "some#{i}"
      end
      resource_type2 = create :resource_type
      resource_type2.fields.create(
        name: "City",
        field_type_id: 7, # complex
        resource_type_reference_id: resource_type.id
      )
      resource_type2.all_field_names.should == %w{City.some0 City.some1 City.some2}
    end
  end

  describe "#check_description" do
    context "when description is valid" do
      it "should not raise error" do
        3.times do |i|
          resource_type.fields.create field_type_id: i + 1, name: "some#{i}"
        end
        expect do
          ResourceType.create!(
            name: "Resource name",
            description: "My $${some2} and $${some1} fields"
          )
        end.not_to raise_error
      end
    end

    context "when description is not valid" do
      it "should raise error" do
        expect do
          rt = ResourceType.create!(name: "Resource name")
          3.times do |i|
            rt.fields.create field_type_id: i + 1, name: "some#{i}"
          end
          rt.description = "My $${other_field} field"
          rt.save!
        end.to raise_error ActiveRecord::RecordInvalid
      end
    end
  end

end