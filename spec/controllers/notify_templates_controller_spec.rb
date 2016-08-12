require 'spec_helper'

describe NotifyTemplatesController, type: :controller, authenticated: true do
  include RSpec::Rails::ControllerExampleGroup  
  render_views
  
  describe 'GET index' do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "GET #index" do
      notify_template1 = create(:notify_template)
      notify_template2 = create(:notify_template)
      get :index
      expect(assigns(:notify_templates)).to match_array([notify_template1,notify_template2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested notify_template to @notify_template" do
      notify_template1 = create(:notify_template)
      get :show, id: notify_template1.id
      expect(assigns(:notify_template)).to eq(notify_template1)
    end

    it "renders the #show view" do
      get :show, id: create(:notify_template)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new notify_template as @notify_template" do
      get :new
      assigns(:notify_template).should be_a_new(NotifyTemplate)
    end
  end

  describe "GET #edit" do
    it "assigns the requested notify_template as @notify_template" do
      notify_template = create(:notify_template)
      get :edit, id: notify_template.id
      assigns(:notify_template).should eq(notify_template)
    end

    it "renders the #edit view" do
      get :edit, id: create(:notify_template)
      response.should render_template :edit
    end
  end

  # describe "POST create" do
  #   context "with valid attributes" do
  #     it "creates a new NotifyTemplate" do
  #         expect{
  #           post :create, notify_template: 
  #           attributes_for(:notify_template)}.
  #           to change(NotifyTemplate, :count).by(1)
  #     end

  #     it "redirects to the new notify_template" do
  #       post :create, notify_template: attributes_for(:notify_template)
  #       response.should redirect_to NotifyTemplate.last
  #     end

  #     # it "assigns a newly created notify_template as @notify_template" do
  #     #   post :create, notify_template:
  #     #   assigns(:notify_template).should be_a(NotifyTemplate)
  #     #   assigns(:notify_template).should be_persisted
  #     # end

  #     # it "redirects to the created notify_template" do
  #     #     post :create, notify_template:
  #     #     response.should redirect_to(NotifyTemplate.last)
  #     # end
  #   end

  #   context "with valid attributes" do
  #     it "does not save the new notify_template" do
  #       expect{
  #         post :create, notify_template: attributes_for(:notify_template, notify_template_name: nil)
  #       }.to_not change(NotifyTemplate, :count)
  #     end

  #     it "re-renders the new method" do
  #       post :create, notify_template: attributes_for(:notify_template, notify_template_name: nil)
  #       response.should render_template :new
  #     end
  #   end
  # end


  describe 'PUT update' do
    before :each do
      @notify_template = create(:notify_template, notify_template_name: "some notify_template_name")
    end

    context "valid attributes" do
      it "located the requested @notify_template" do
        put :update, id: @notify_template, notify_template: attributes_for(:notify_template)
        assigns(:notify_template).should eq(@notify_template)
      end

      it "changes @notify_template's attributes" do
        put :update, id: @notify_template,
        notify_template: attributes_for(:notify_template, notify_template_name: "some notify_template_name")
        @notify_template.reload
        @notify_template.notify_template_name.should eq("some notify_template_name")
      end

      it "redirects to the updated notify_template" do
        put :update, id: @notify_template, notify_template: attributes_for(:notify_template)
        response.should redirect_to @notify_template
      end
    end

    context "invalid attributes" do
      it "locates the request @notify_template" do
        put :update, id: @notify_template, notify_template: attributes_for(:notify_template, notify_template_name: nil)
        assigns(:notify_template).should eq(@notify_template)
      end

      it "does not changes @notify_template's attributes" do
        put :update, id: @notify_template,
        notify_template: attributes_for(:notify_template, notify_template_name: nil)
        @notify_template.reload
        @notify_template.notify_template_name.should eq("some notify_template_name")
      end

      it "re-renders the edit method" do
        put :update, id: @notify_template, notify_template: attributes_for(:notify_template, notify_template_name: nil)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @notify_template = create(:notify_template)
    end

    it "deletes the notify_template" do
      expect{
        delete :destroy, id: @notify_template
      }.to change(NotifyTemplate, :count).by(-1)
    end

    it "redirects to notify_template#index" do
      delete :destroy, id: @notify_template
      response.should redirect_to notify_templates_url(:only_path => true)
    end
  end
end
