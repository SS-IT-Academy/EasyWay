require "spec_helper"

describe NotifyTemplatesController, type: :controller do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/notify_templates").to route_to(controller: "notify_templates", action: "index")      
    end

    it "routes to #new" do
      expect(:get => "/notify_templates/new").to route_to(controller: "notify_templates", action: "new")      
    end

    it "routes to #show" do
      expect(:get => "/notify_templates/1").to route_to(controller: "notify_templates", action: "show", id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/notify_templates/1/edit").to route_to(controller: "notify_templates", action: "edit", id: '1')      
    end

    it "routes to #create" do
      expect(:post => "/notify_templates").to route_to(controller: "notify_templates", action: "create")      
    end

    it "routes to #update" do
      expect(:put => "/notify_templates/1").to route_to(controller: "notify_templates", action: "update", id: '1')      
    end

    it "routes to #destroy" do
      expect(:delete => "/notify_templates/1").to route_to(controller: "notify_templates", action: "destroy", id: '1')      
    end

  end
end
