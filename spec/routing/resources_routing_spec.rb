require "spec_helper"

describe ResourcesController, type: :controller do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resources").to route_to(controller: "resources", action: "index")
    end

    it "routes to #new" do
      expect(:get => "/resources/new").to route_to(controller: "resources", action: "new")
    end

    it "routes to #show" do
      expect(:get => "/resources/1").to route_to(controller: "resources", action: "show", id: '1')
    end

    it "routes to #edit" do
      expect(:get => "/resources/1/edit").to route_to(controller: "resources", action: "edit", id: '1')
    end

    it "routes to #create" do
      expect(:post => "/resources").to route_to(controller: "resources", action: "create")
    end

    it "routes to #update" do
      expect(:put => "/resources/1").to route_to(controller: "resources", action: "update", id: '1')
    end

    it "routes to #destroy" do
      expect(:delete => "/resources/1").to route_to(controller: "resources", action: "destroy", id: '1')
    end

  end
end
