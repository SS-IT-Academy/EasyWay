
require 'spec_helper'

describe NotifySchedulersController do

  describe 'GET index' do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end


    it "GET #index" do
      notify_scheduler1 = create(:notify_scheduler)
      notify_scheduler2 = create(:notify_scheduler)
      get :index
      expect(assigns(:notify_schedulers)).to match_array([notify_scheduler1,notify_scheduler2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested notify_scheduler to @notify_scheduler" do
      notify_scheduler1 = create(:notify_scheduler)
      get :show, id: notify_scheduler1.id
      expect(assigns(:notify_scheduler)).to eq(notify_scheduler1)
    end

    it "renders the #show view" do
      get :show, id: create(:notify_scheduler)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new notify_scheduler as @notify_scheduler" do
      get :new
      assigns(:notify_scheduler).should be_a_new(NotifyScheduler)
    end
  end

  describe "GET #edit" do
    it "assigns the requested notify_scheduler as @notify_scheduler" do
      notify_scheduler = create(:notify_scheduler)
      get :edit, id: notify_scheduler.id
      assigns(:notify_scheduler).should eq(notify_scheduler)
    end

    it "renders the #edit view" do
      get :edit, id: create(:notify_scheduler)
      response.should render_template :edit
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new NotifyScheduler" do
          expect{
            post :create, notify_scheduler: 
            attributes_for(:notify_scheduler)}.
            to change(NotifyScheduler, :count).by(1)
      end

      it "redirects to the new notify_scheduler" do
        post :create, notify_scheduler: attributes_for(:notify_scheduler)
        response.should redirect_to NotifyScheduler.last
      end

      # it "assigns a newly created notify_scheduler as @notify_scheduler" do
      #   post :create, notify_scheduler:
      #   assigns(:notify_scheduler).should be_a(NotifyScheduler)
      #   assigns(:notify_scheduler).should be_persisted
      # end

      # it "redirects to the created notify_scheduler" do
      #     post :create, notify_scheduler:
      #     response.should redirect_to(NotifyScheduler.last)
      # end
    end

    context "with valid attributes" do
      it "does not save the new notify_scheduler" do
        expect{
          post :create, notify_scheduler: attributes_for(:notify_scheduler, period: nil)
        }.to_not change(NotifyScheduler, :count)
      end

      it "re-renders the new method" do
        post :create, notify_scheduler: attributes_for(:notify_scheduler, period: nil)
        response.should render_template :new
      end
    end
  end


  describe 'PUT update' do
    before :each do
      @notify_scheduler = create(:notify_scheduler, period: 25)
    end

    context "valid attributes" do
      it "located the requested @notify_scheduler" do
        put :update, id: @notify_scheduler, notify_scheduler: attributes_for(:notify_scheduler)
        assigns(:notify_scheduler).should eq(@notify_scheduler)
      end

      it "changes @notify_scheduler's attributes" do
        put :update, id: @notify_scheduler,
        notify_scheduler: attributes_for(:notify_scheduler, period: 25)
        @notify_scheduler.reload
        @notify_scheduler.period.should eq(25)
      end

      it "redirects to the updated notify_scheduler" do
        put :update, id: @notify_scheduler, notify_scheduler: attributes_for(:notify_scheduler)
        response.should redirect_to @notify_scheduler
      end
    end

    context "invalid attributes" do
      it "locates the request @notify_scheduler" do
        put :update, id: @notify_scheduler, notify_scheduler: attributes_for(:notify_scheduler, period: nil)
        assigns(:notify_scheduler).should eq(@notify_scheduler)
      end

      it "does not changes @notify_scheduler's attributes" do
          put :update, id: @notify_scheduler,
          notify_scheduler: attributes_for(:notify_scheduler, period: nil)
          @notify_scheduler.reload
          @notify_scheduler.period.should eq(25)
      end

      it "re-renders the edit method" do
          put :update, id: @notify_scheduler, notify_scheduler: attributes_for(:notify_scheduler, period: nil)
          response.should render_template :edit
      end
    end

  end

  describe 'DELETE destroy' do
    before :each do
      @notify_scheduler = create(:notify_scheduler)
    end

    it "deletes the notify_scheduler" do
    expect{
      delete :destroy, id: @notify_scheduler
      }.to change(NotifyScheduler, :count).by(-1)
    end

    it "redirects to notify_scheduler#index" do
      delete :destroy, id: @notify_scheduler
      response.should redirect_to notify_schedulers_url
    end
  end

end
