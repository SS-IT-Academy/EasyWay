require "spec_helper"

describe FieldTypesController, type: :controller do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/field_types").to route_to(controller: "field_types", action: "index")      
    end

    it "routes to #new" do
      expect(:get => "/field_types/new").to route_to(controller: "field_types", action: "new")      
    end

    it "routes to #show" do
      expect(:get => "/field_types/1").to route_to(controller: "field_types", action: "show", id: '1')      
    end

    it "routes to #edit" do
      expect(:get => "/field_types/1/edit").to route_to(controller: "field_types", action: "edit", id: '1')      
    end

    it "routes to #create" do
      expect(:post => "/field_types").to route_to(controller: "field_types", action: "create")      
    end

    it "routes to #update" do
      expect(:put => "/field_types/1").to route_to(controller: "field_types", action: "update", id: '1')      
    end

    it "routes to #destroy" do
      expect(:delete => "/field_types/1").to route_to(controller: "field_types", action: "destroy", id: '1')      
    end

  end
end
