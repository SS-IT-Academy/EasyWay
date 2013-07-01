require "spec_helper"

describe NotifyEventsController do
  describe "routing" do

    it "routes to #index" do
      get("/notify_events").should route_to("notify_events#index")
    end

    it "routes to #new" do
      get("/notify_events/new").should route_to("notify_events#new")
    end

    it "routes to #show" do
      get("/notify_events/1").should route_to("notify_events#show", :id => "1")
    end

    it "routes to #edit" do
      get("/notify_events/1/edit").should route_to("notify_events#edit", :id => "1")
    end

    it "routes to #create" do
      post("/notify_events").should route_to("notify_events#create")
    end

    it "routes to #update" do
      put("/notify_events/1").should route_to("notify_events#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/notify_events/1").should route_to("notify_events#destroy", :id => "1")
    end

  end
end
