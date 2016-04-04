require 'spec_helper'

describe "EventResources", type: :controller, authenticated: true do
  describe "GET /event_resources" do
    it "works! (now write some real specs)" do
      @controller = EventResourcesController.new	
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
