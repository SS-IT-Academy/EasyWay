require "spec_helper"

describe FieldsController do
  describe "routing" do

    it "routes to #index" do
      get("/fields").should route_to("fields#index")
    end

    it "routes to #new" do
      get("/fields/new").should route_to("fields#new")
    end

    it "routes to #show" do
      get("/fields/1").should route_to("fields#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fields/1/edit").should route_to("fields#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fields").should route_to("fields#create")
    end

    it "routes to #update" do
      put("/fields/1").should route_to("fields#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fields/1").should route_to("fields#destroy", :id => "1")
    end

  end
end
