require "spec_helper"

describe ResourceTypesController, type: :controller do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resource_types").to route_to(controller: "resource_types", action: "index")      
    end

    it "routes to #new" do
      expect(:get => "/resource_types/new").to route_to(controller: "resource_types", action: "new")      
    end

    it "routes to #show" do
      expect(:get => "/resource_types/1").to route_to(controller: "resource_types", action: "show", id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/resource_types/1/edit").to route_to(controller: "resource_types", action: "edit", id: '1')      
    end

    it "routes to #create" do
      expect(:post => "/resource_types").to route_to(controller: "resource_types", action: "create")      
    end

    it "routes to #update" do
      expect(:put => "/resource_types/1").to route_to(controller: "resource_types", action: "update", id: '1')      
    end

    it "routes to #destroy" do
      expect(:delete => "/resource_types/1").to route_to(controller: "resource_types", action: "destroy", id: '1')      
    end

  end
end
