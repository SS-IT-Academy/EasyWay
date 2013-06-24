require "spec_helper"

describe ResourceValuesController do
  describe "routing" do

    it "routes to #index" do
      get("/resource_values").should route_to("resource_values#index")
    end

    it "routes to #new" do
      get("/resource_values/new").should route_to("resource_values#new")
    end

    it "routes to #show" do
      get("/resource_values/1").should route_to("resource_values#show", :id => "1")
    end

    it "routes to #edit" do
      get("/resource_values/1/edit").should route_to("resource_values#edit", :id => "1")
    end

    it "routes to #create" do
      post("/resource_values").should route_to("resource_values#create")
    end

    it "routes to #update" do
      put("/resource_values/1").should route_to("resource_values#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/resource_values/1").should route_to("resource_values#destroy", :id => "1")
    end

  end
end
