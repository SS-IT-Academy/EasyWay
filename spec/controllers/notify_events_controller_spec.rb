require 'spec_helper'

describe NotifyEventsController do

  describe 'GET index' do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end


    it "GET #index" do
      notify_event1 = create(:notify_event)
      notify_event2 = create(:notify_event)
      get :index
      expect(assigns(:notify_events)).to match_array([notify_event1,notify_event2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested notify_event to @notify_event" do
      notify_event1 = create(:notify_event)
      get :show, id: notify_event1.event_id
      expect(assigns(:notify_event)).to eq(notify_event1)
    end

    it "renders the #show view" do
      get :show, id: create(:notify_event)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new notify_event as @notify_event" do
      get :new
      assigns(:notify_event).should be_a_new(NotifyEvent)
    end
  end

  describe "GET #edit" do
    it "assigns the requested notify_event as @notify_event" do
      notify_event = create(:notify_event)
      get :edit, id: notify_event.event_id
      assigns(:notify_event).should eq(notify_event)
    end

    it "renders the #edit view" do
      get :edit, id: create(:notify_event)
      response.should render_template :edit
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new NotifyEvent" do
        recipient = create(:recipient)
        mapping = create(:mapping)
        template = create(:notify_template)

          expect{
            post :create, notify_event: 
            attributes_for(:notify_event)}.
            to change(NotifyEvent, :count).by(1)
      end

      it "redirects to the new notify_event" do
        recipient = create(:recipient)
        mapping = create(:mapping)
        template = create(:notify_template)
        post :create, notify_event: attributes_for(:notify_event)
        response.should redirect_to NotifyEvent.last
      end

      # it "assigns a newly created notify_event as @notify_event" do
      #   post :create, notify_event:
      #   assigns(:notify_event).should be_a_new(NotifyEvent)
      #   assigns(:notify_event).should be_persisted
      # end

      # it "redirects to the created notify_event" do
      #     post :create, notify_event:
      #     response.should redirect_to(NotifyEvent.last)
      # end
    end

    context "with valid attributes" do
      it "does not save the new notify_event" do
        recipient = create(:recipient)
        mapping = create(:mapping)
        template = create(:notify_template)
        expect{
          post :create, notify_event: attributes_for(:notify_event, name: nil)
        }.to_not change(NotifyEvent, :count)
      end

      it "re-renders the new method" do
        recipient = create(:recipient)
        mapping = create(:mapping)
        template = create(:notify_template)
        post :create, notify_event: attributes_for(:notify_event, name: nil)
        response.should render_template :new
      end
    end
  end


  describe 'PUT update' do
    before :each do
      @notify_event = create(:notify_event, name: "some name")
    end

    context "valid attributes" do
      it "located the requested @notify_event" do
        put :update, id: @notify_event, notify_event: attributes_for(:notify_event)
        assigns(:notify_event).should eq(@notify_event)
      end

      it "changes @notify_event's attributes" do
        put :update, id: @notify_event,
        notify_event: attributes_for(:notify_event, name: "some name")
        @notify_event.reload
        @notify_event.name.should eq("some name")
      end

      it "redirects to the updated notify_event" do
        put :update, id: @notify_event, notify_event: attributes_for(:notify_event)
        response.should redirect_to @notify_event
      end
    end

    context "invalid attributes" do
      it "locates the request @notify_event" do
        put :update, id: @notify_event, notify_event: attributes_for(:notify_event, name: nil)
        assigns(:notify_event).should eq(@notify_event)
      end

      it "does not changes @notify_event's attributes" do
          put :update, id: @notify_event,
          notify_event: attributes_for(:notify_event, name: nil)
          @notify_event.reload
          @notify_event.name.should eq("some name")
      end

      it "re-renders the edit method" do
          put :update, id: @notify_event, notify_event: attributes_for(:notify_event, name: nil)
          response.should render_template :edit
      end
    end

  end

  describe 'DELETE destroy' do
    before :each do
      @notify_event = create(:notify_event)
    end

    it "deletes the notify_event" do
    expect{
      delete :destroy, id: @notify_event
      }.to change(NotifyEvent, :count).by(-1)
    end

    it "redirects to notify_event#index" do
      delete :destroy, id: @notify_event
      response.should redirect_to notify_events_url
    end
  end

end
