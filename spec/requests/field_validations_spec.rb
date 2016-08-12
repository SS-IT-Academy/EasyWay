require 'spec_helper'

describe "FieldValidations", type: :controller, authenticated: true do
  render_views

  describe "GET /field_validations" do
    it "works! (now write some real specs)" do
      @controller = FieldValidationsController.new	
      get :index
      response.status.should be(200)
    end
  end
end
