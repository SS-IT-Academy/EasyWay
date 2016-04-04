require 'spec_helper'

describe "ResourceValues", type: :controller, authenticated: true do
  include RSpec::Rails::ControllerExampleGroup
  	
  describe "GET /resource_values" do
    it "works! (now write some real specs)" do
      @controller = ResourceValuesController.new
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
