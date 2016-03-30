require 'spec_helper'

describe "Validators", type: :controller, authenticated: true do	
  describe "validators" do	  
    it "works! (now write some real specs)" do
	  @controller = ValidatorsController.new
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get :index
      response.status.should be(200)
    end
  end
end
