require 'spec_helper'

describe FieldType do
  let(:field_type) { create(:field_type) }

  subject { field_type }

  it { should respond_to(:name) }
  it { should respond_to(:fields) }

  it { should be_valid }

  describe "with blank name" do
    before { field_type.name = ' ' }
    it { should_not be_valid }
  end
end
