require "spec_helper"

describe FieldsController, type: :controller do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fields").to route_to(controller: "fields", action: "index")      
    end

    it "routes to #new" do
      expect(:get => "/fields/new").to route_to(controller: "fields", action: "new")      
    end

    it "routes to #show" do
      expect(:get => "/fields/1").to route_to(controller: "fields", action: "show", id: '1')      
    end

    it "routes to #edit" do
      expect(:get => "/fields/1/edit").to route_to(controller: "fields", action: "edit", id: '1')      
    end

    it "routes to #create" do
      expect(:post => "/fields").to route_to(controller: "fields", action: "create")      
    end

    it "routes to #update" do
      expect(:put => "/fields/1").to route_to(controller: "fields", action: "update", id: '1')      
    end

    it "routes to #destroy" do
      expect(:delete => "/fields/1").to route_to(controller: "fields", action: "destroy", id: '1')      
    end

  end
end
