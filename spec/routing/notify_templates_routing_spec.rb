require "spec_helper"

describe NotifyTemplatesController do
  describe "routing" do

    it "routes to #index" do
      get("/notify_templates").should route_to("notify_templates#index")
    end

    it "routes to #new" do
      get("/notify_templates/new").should route_to("notify_templates#new")
    end

    it "routes to #show" do
      get("/notify_templates/1").should route_to("notify_templates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/notify_templates/1/edit").should route_to("notify_templates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/notify_templates").should route_to("notify_templates#create")
    end

    it "routes to #update" do
      put("/notify_templates/1").should route_to("notify_templates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/notify_templates/1").should route_to("notify_templates#destroy", :id => "1")
    end

  end
end
