require 'spec_helper'

describe "FieldTypes", type: :controller, authenticated: true do
  render_views

  describe "GET /field_types" do
    it "works! (now write some real specs)" do
      @controller = FieldTypesController.new	
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
