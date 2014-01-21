require 'spec_helper'

describe EventResourcesController do

  context "GET index" do

    it "event_resources should include event_resource" do
      event_resource1 = create(:event_resource)
      event_resource2 = create(:event_resource)
      get :index
      expect(assigns(:event_resources)).to eq([event_resource1,event_resource2])
    end

    it "expected response from index page" do
      get :index
      expect(response).to render_template(:index)
    end

  end

  context "GET show" do

    it "event_resource should be equal event_resource" do
      event_resource = create(:event_resource)
      get :show, id: event_resource
      expect(assigns(:event_resource)).to eq(event_resource)
    end

    it "expected response from show page" do
      get :show, id: create(:event_resource)
      expect(response).to render_template(:show)
    end

  end

  context "GET new" do

    it "event_resource should not be a new EventResource" do
      get :new
      expect(assigns(:event_resources)).to_not be_a_new(EventResource)
    end

    it "event_resource should be a new EventResource" do
      get :new
      expect(assigns(:event_resource)).to be_a_new(EventResource)
    end

    it "unexpected response from new page" do
      get :new
      expect(response).to_not render_template(:news)
    end

    it "expected response from new page" do
      get :new
      expect(response).to render_template(:new)
    end

  end

  context "GET edit" do

    it 'event_resource equal event_resource' do
      event_resource = create(:event_resource)
      get :edit, id: event_resource
      expect(assigns(:event_resource)).to eq(event_resource)
    end

    it 'render edit page' do
      get :edit, id: create(:event_resource)
      expect(response).to render_template(:edit)
    end

  end

  context "POST create" do

    it "expected creating new EventResource" do
      expect{
        post :create, event_resource: attributes_for(:event_resource)
      }.to change(EventResource,:count).by(1)
    end

    it "redirects to the new EventResource" do
      post :create, event_resource: attributes_for(:event_resource)
      response.should redirect_to EventResource.last
    end

    it "does not create new EventResource" do
      expect{
        post :create, event_resource: attributes_for(:invalid_event_resource)
      }.to_not change(EventResource,:count)
    end

    it "render new action page" do
      post :create, event_resource: attributes_for(:invalid_event_resource)
      response.should render_template :new
    end

  end

  context "PUT update" do

    it "event_resource should be equal event_resource" do
      event_resource = create(:event_resource)
      put :update, id: event_resource
      assigns(:event_resource).should eq(event_resource)
    end

    it "event_resource should not be equal event_resource" do
      event_resource1 = create(:event_resource)
      event_resource2 = create(:event_resource)
      put :update, id: event_resource1
      expect(assigns(:event_resource1)).to_not eq (event_resource2)
    end

    it "changes event_resource's attributes" do
      event_resource = create(:event_resource)
      put :update, id: event_resource, event_resource: attributes_for(:event_resource,
        resource_id: 3,
        event_id: 4
      )
      event_resource.reload
      event_resource.resource_id.should eq(3)
      event_resource.event_id.should eq(4)
    end

    it "redirects to the updated event_resource" do
      put :update, id: create(:event_resource), event_resource: attributes_for(:event_resource, event_id: 8)
      response.should redirect_to :event_resource
    end

    it 'render event_resource_edit_path when invalid_event_resource' do
      put :update, id: create(:event_resource), event_resource: attributes_for(:invalid_event_resource)
      response.should render_template :edit
    end

  end

  context "DELETE destroy" do

    it "deletes event_resource" do 
      event_resource = create(:event_resource)
      expect{
        delete :destroy, id: event_resource
      }.to change(EventResource,:count).by(-1)
    end

    it "redirects to event_resource_url" do
      delete :destroy, id: create(:event_resource)
      response.should redirect_to event_resources_url
    end

  end

end