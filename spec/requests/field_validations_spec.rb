require 'spec_helper'

describe "FieldValidations" do
  describe "GET /field_validations" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get field_validations_path
      response.status.should be(200)
    end
  end
end
