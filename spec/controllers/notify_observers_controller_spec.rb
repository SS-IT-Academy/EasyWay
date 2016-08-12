
require 'spec_helper'

describe NotifyObserversController, type: :controller, authenticated: true do
  render_views

  describe 'GET index' do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "GET #index" do
      notify_observer1 = create(:notify_observer)
      notify_observer2 = create(:notify_observer)
      get :index
      expect(assigns(:notify_observers)).to match_array([notify_observer1,notify_observer2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested notify_observer to @notify_observer" do
      notify_observer1 = create(:notify_observer)
      get :show, id: notify_observer1.id
      expect(assigns(:notify_observer)).to eq(notify_observer1)
    end

    it "renders the #show view" do
      get :show, id: create(:notify_observer)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new notify_observer as @notify_observer" do
      get :new
      assigns(:notify_observer).should be_a_new(NotifyObserver)
    end
  end

  describe "GET #edit" do
    it "assigns the requested notify_observer as @notify_observer" do
      notify_observer = create(:notify_observer)
      get :edit, id: notify_observer.id
      assigns(:notify_observer).should eq(notify_observer)
    end

    it "renders the #edit view" do
      get :edit, id: create(:notify_observer)
      response.should render_template :edit
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new Notifyobserver" do
        expect{
          post :create, notify_observer: 
          attributes_for(:notify_observer)
        }.to change(NotifyObserver, :count).by(1)
      end

      it "redirects to the new notify_observer" do
        post :create, notify_observer: attributes_for(:notify_observer)
        response.should redirect_to NotifyObserver.last
      end

      # it "assigns a newly created notify_observer as @notify_observer" do
      #   post :create, notify_observer:
      #   assigns(:notify_observer).should be_a(Notifyobserver)
      #   assigns(:notify_observer).should be_persisted
      # end

      # it "redirects to the created notify_observer" do
      #     post :create, notify_observer:
      #     response.should redirect_to(Notifyobserver.last)
      # end
    end

    context "with valid attributes" do
      it "does not save the new notify_observer" do
        expect{
          post :create, notify_observer: attributes_for(:notify_observer, name: nil)
        }.to_not change(NotifyObserver, :count)
      end

      it "re-renders the new method" do
        post :create, notify_observer: attributes_for(:notify_observer, name: nil)
        response.should render_template :new
      end
    end
  end

  describe 'PUT update' do
    before :each do
      @notify_observer = create(:notify_observer, name: "some name")
    end

    context "valid attributes" do
      it "located the requested @notify_observer" do
        put :update, id: @notify_observer, notify_observer: attributes_for(:notify_observer)
        assigns(:notify_observer).should eq(@notify_observer)
      end

      it "changes @notify_observer's attributes" do
        put :update, id: @notify_observer,
        notify_observer: attributes_for(:notify_observer, name: "some name")
        @notify_observer.reload
        @notify_observer.name.should eq("some name")
      end

      it "redirects to the updated notify_observer" do
        put :update, id: @notify_observer, notify_observer: attributes_for(:notify_observer)
        response.should redirect_to @notify_observer
      end
    end

    context "invalid attributes" do
      it "locates the request @notify_observer" do
        put :update, id: @notify_observer, notify_observer: attributes_for(:notify_observer, name: nil)
        assigns(:notify_observer).should eq(@notify_observer)
      end

      it "does not changes @notify_observer's attributes" do
        put :update, id: @notify_observer,
        notify_observer: attributes_for(:notify_observer, name: nil)
        @notify_observer.reload
        @notify_observer.name.should eq("some name")
      end

      it "re-renders the edit method" do
        put :update, id: @notify_observer, notify_observer: attributes_for(:notify_observer, name: nil)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @notify_observer = create(:notify_observer)
    end

    it "deletes the notify_observer" do
      expect{
        delete :destroy, id: @notify_observer
      }.to change(NotifyObserver, :count).by(-1)
    end

    it "redirects to notify_observer#index" do
      delete :destroy, id: @notify_observer
      response.should redirect_to notify_observers_url(:only_path => true)
    end
  end
end