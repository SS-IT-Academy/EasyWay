require "spec_helper"

describe ResourcesController do
  describe "routing" do

    it "routes to #index" do
      get("/resources").should route_to("resources#index")
    end

    it "routes to #new" do
      get("/resources/new").should route_to("resources#new")
    end

    it "routes to #show" do
      get("/resources/1").should route_to("resources#show", :id => "1")
    end

    it "routes to #edit" do
      get("/resources/1/edit").should route_to("resources#edit", :id => "1")
    end

    it "routes to #create" do
      post("/resources").should route_to("resources#create")
    end

    it "routes to #update" do
      put("/resources/1").should route_to("resources#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/resources/1").should route_to("resources#destroy", :id => "1")
    end

  end
end
