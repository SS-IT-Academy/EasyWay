require 'spec_helper'

describe "TableFilters" do
  describe "GET /table_filters" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get table_filters_index_path
      response.status.should be(200)
    end
  end
end
