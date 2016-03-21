require 'spec_helper'

describe FieldValidation do
  let(:field_validation) { create :field_validation }
  
  subject { field_validation }

  it { should respond_to(:field_id) }
  it { should respond_to(:validator_id) }
  
end

