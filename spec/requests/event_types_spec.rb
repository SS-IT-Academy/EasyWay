require 'spec_helper'

describe "EventTypes", type: :controller, authenticated: true do
  render_views

  describe "GET /event_types" do
    it "works! (now write some real specs)" do
      @controller = EventTypesController.new	
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
