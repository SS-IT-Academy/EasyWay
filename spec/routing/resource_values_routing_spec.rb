require "spec_helper"

describe ResourceValuesController, type: :controller do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resource_values").to route_to(controller: "resource_values", action: "index")      
    end

    it "routes to #new" do
      expect(:get => "/resource_values/new").to route_to(controller: "resource_values", action: "new")      
    end

    it "routes to #show" do
      expect(:get => "/resource_values/1").to route_to(controller: "resource_values", action: "show", id: '1')      
    end

    it "routes to #edit" do
      expect(:get => "/resource_values/1/edit").to route_to(controller: "resource_values", action: "edit", id: '1')      
    end

    it "routes to #create" do
      expect(:post => "/resource_values").to route_to(controller: "resource_values", action: "create")      
    end

    it "routes to #update" do
      expect(:put => "/resource_values/1").to route_to(controller: "resource_values", action: "update", id: '1')      
    end

    it "routes to #destroy" do
      expect(:delete => "/resource_values/1").to route_to(controller: "resource_values", action: "destroy", id: '1')      
    end

  end
end
