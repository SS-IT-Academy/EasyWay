require "spec_helper"

describe FieldTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/field_types").should route_to("field_types#index")
    end

    it "routes to #new" do
      get("/field_types/new").should route_to("field_types#new")
    end

    it "routes to #show" do
      get("/field_types/1").should route_to("field_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/field_types/1/edit").should route_to("field_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/field_types").should route_to("field_types#create")
    end

    it "routes to #update" do
      put("/field_types/1").should route_to("field_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/field_types/1").should route_to("field_types#destroy", :id => "1")
    end

  end
end
