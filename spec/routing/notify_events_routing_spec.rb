require "spec_helper"

describe NotifyEventsController, type: :controller do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/notify_events").to route_to(controller: "notify_events", action: "index")      
    end

    it "routes to #new" do
      expect(:get => "/notify_events/new").to route_to(controller: "notify_events", action: "new")      
    end

    it "routes to #show" do
      expect(:get => "/notify_events/1").to route_to(controller: "notify_events", action: "show", id: '1')      
    end

    it "routes to #edit" do
      expect(:get => "/notify_events/1/edit").to route_to(controller: "notify_events", action: "edit", id: '1')      
    end

    it "routes to #create" do
      expect(:post => "/notify_events").to route_to(controller: "notify_events", action: "create")      
    end

    it "routes to #update" do
      expect(:put => "/notify_events/1").to route_to(controller: "notify_events", action: "update", id: '1')      
    end

    it "routes to #destroy" do
      expect(:delete => "/notify_events/1").to route_to(controller: "notify_events", action: "destroy", id: '1')      
    end

  end
end
