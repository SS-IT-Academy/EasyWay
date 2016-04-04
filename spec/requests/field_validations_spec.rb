require 'spec_helper'

describe "FieldValidations", type: :controller, authenticated: true do
  describe "GET /field_validations" do
    it "works! (now write some real specs)" do
      @controller = FieldValidationsController.new	
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
