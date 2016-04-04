require 'spec_helper'

describe "Fields", type: :controller, authenticated: true do
  describe "GET /fields" do
    it "works! (now write some real specs)" do
      @controller = FieldsController.new	
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
