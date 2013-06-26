require "spec_helper"

describe TableHeadersController do
  describe "routing" do

    it "routes to #index" do
      get("/table_headers").should route_to("table_headers#index")
    end

    it "routes to #new" do
      get("/table_headers/new").should route_to("table_headers#new")
    end

    it "routes to #show" do
      get("/table_headers/1").should route_to("table_headers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/table_headers/1/edit").should route_to("table_headers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/table_headers").should route_to("table_headers#create")
    end

    it "routes to #update" do
      put("/table_headers/1").should route_to("table_headers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/table_headers/1").should route_to("table_headers#destroy", :id => "1")
    end

  end
end
