require 'spec_helper'

describe "NotifyEvents", type: :controller, authenticated: true do
  include RSpec::Rails::ControllerExampleGroup
  render_views
  	
  describe "GET /notify_events" do
    it "works! (now write some real specs)" do
      @controller = NotifyEventsController.new	
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
