require 'spec_helper'

describe "Resources", type: :controller, authenticated: true do
  describe "GET /resources" do
    it "works! (now write some real specs)" do
      @controller = ResourcesController.new	
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
