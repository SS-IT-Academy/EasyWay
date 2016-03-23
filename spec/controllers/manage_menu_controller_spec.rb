require 'spec_helper'

describe ManageMenuController , type: :controller, authenticated: true do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
