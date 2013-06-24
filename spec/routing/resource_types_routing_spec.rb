require "spec_helper"

describe ResourceTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/resource_types").should route_to("resource_types#index")
    end

    it "routes to #new" do
      get("/resource_types/new").should route_to("resource_types#new")
    end

    it "routes to #show" do
      get("/resource_types/1").should route_to("resource_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/resource_types/1/edit").should route_to("resource_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/resource_types").should route_to("resource_types#create")
    end

    it "routes to #update" do
      put("/resource_types/1").should route_to("resource_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/resource_types/1").should route_to("resource_types#destroy", :id => "1")
    end

  end
end
