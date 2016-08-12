require 'spec_helper'

describe "ResourceTypes", type: :controller, authenticated: true do  	
  render_views

  describe "GET /resource_types" do
    it "works! (now write some real specs)" do
      @controller = ResourceTypesController.new
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
