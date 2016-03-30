
require 'spec_helper'

describe NotifyObserverPropertiesController , type: :controller, authenticated: true do
  describe 'GET index' do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end


    it "GET #index" do
      notify_observer_property1 = create(:notify_observer_property)
      notify_observer_property2 = create(:notify_observer_property)
      get :index
      expect(assigns(:notify_observer_properties)).to match_array([notify_observer_property1,notify_observer_property2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested notify_observer_property to @notify_observer_property" do
      notify_observer_property1 = create(:notify_observer_property)
      get :show, id: notify_observer_property1.id
      expect(assigns(:notify_observer_property)).to eq(notify_observer_property1)
    end

    it "renders the #show view" do
      get :show, id: create(:notify_observer_property)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new notify_observer_property as @notify_observer_property" do
      get :new
      assigns(:notify_observer_property).should be_a_new(NotifyObserverProperty)
    end
  end

  describe "GET #edit" do
    it "assigns the requested notify_observer_property as @notify_observer_property" do
      notify_observer_property = create(:notify_observer_property)
      get :edit, id: notify_observer_property.id
      assigns(:notify_observer_property).should eq(notify_observer_property)
    end

    it "renders the #edit view" do
      get :edit, id: create(:notify_observer_property)
      response.should render_template :edit
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new Notifyobserver_property" do
          expect{
            post :create, notify_observer_property: 
            attributes_for(:notify_observer_property)}.
            to change(NotifyObserverProperty, :count).by(1)
      end

      it "redirects to the new notify_observer_property" do
        post :create, notify_observer_property: attributes_for(:notify_observer_property)
        response.should redirect_to NotifyObserverProperty.last
      end

      # it "assigns a newly created notify_observer_property as @notify_observer_property" do
      #   post :create, notify_observer_property:
      #   assigns(:notify_observer_property).should be_a(Notifyobserver_property)
      #   assigns(:notify_observer_property).should be_persisted
      # end

      # it "redirects to the created notify_observer_property" do
      #     post :create, notify_observer_property:
      #     response.should redirect_to(Notifyobserver_property.last)
      # end
    end

    context "with valid attributes" do
      it "does not save the new notify_observer_property" do
        expect{
          post :create, notify_observer_property: attributes_for(:notify_observer_property, name: nil)
        }.to_not change(NotifyObserverProperty, :count)
      end

      it "re-renders the new method" do
        post :create, notify_observer_property: attributes_for(:notify_observer_property, name: nil)
        response.should render_template :new
      end
    end
  end


  describe 'PUT update' do
    before :each do
      @notify_observer_property = create(:notify_observer_property, name: "some name")
    end

    context "valid attributes" do
      it "located the requested @notify_observer_property" do
        put :update, id: @notify_observer_property, notify_observer_property: attributes_for(:notify_observer_property)
        assigns(:notify_observer_property).should eq(@notify_observer_property)
      end

      it "changes @notify_observer_property's attributes" do
        put :update, id: @notify_observer_property,
        notify_observer_property: attributes_for(:notify_observer_property, name: "some name")
        @notify_observer_property.reload
        @notify_observer_property.name.should eq("some name")
      end

      it "redirects to the updated notify_observer_property" do
        put :update, id: @notify_observer_property, notify_observer_property: attributes_for(:notify_observer_property)
        response.should redirect_to @notify_observer_property
      end
    end

    context "invalid attributes" do
      it "locates the request @notify_observer_property" do
        put :update, id: @notify_observer_property, notify_observer_property: attributes_for(:notify_observer_property, name: nil)
        assigns(:notify_observer_property).should eq(@notify_observer_property)
      end

      it "does not changes @notify_observer_property's attributes" do
          put :update, id: @notify_observer_property,
          notify_observer_property: attributes_for(:notify_observer_property, name: nil)
          @notify_observer_property.reload
          @notify_observer_property.name.should eq("some name")
      end

      it "re-renders the edit method" do
          put :update, id: @notify_observer_property, notify_observer_property: attributes_for(:notify_observer_property, name: nil)
          response.should render_template :edit
      end
    end

  end

  describe 'DELETE destroy' do
    before :each do
      @notify_observer_property = create(:notify_observer_property)
    end

    it "deletes the notify_observer_property" do
    expect{
      delete :destroy, id: @notify_observer_property
      }.to change(NotifyObserverProperty, :count).by(-1)
    end

    it "redirects to notify_observer_property#index" do
      delete :destroy, id: @notify_observer_property
      response.should redirect_to notify_observer_properties_url
    end
  end

end