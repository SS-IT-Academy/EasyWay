require 'spec_helper'

describe Validator do
  let(:validator) { create :validator }
  
  subject { validator }

  it { should respond_to(:body) }
  it { should respond_to(:field_type_id) }
  it { should respond_to(:name) }
  it { should respond_to(:message) }
  it { should respond_to(:field_validations) }
  it { should respond_to(:fields) }

  it { should be_valid }

  describe "when name is not present" do
    before { validator.name = '' }
    it { should_not be_valid }
  end


  describe "when body is not present" do
    before { validator.body = '' }
    it { should_not be_valid }
  end

  describe "when message is not present" do
    before { validator.message = '' }
    it { should_not be_valid }
  end

end

