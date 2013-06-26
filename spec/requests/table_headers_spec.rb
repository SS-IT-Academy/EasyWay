require 'spec_helper'

describe "TableHeaders" do
  describe "GET /table_headers" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get table_headers_path
      response.status.should be(200)
    end
  end
end
