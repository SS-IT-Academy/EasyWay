require 'spec_helper'

describe RecipientsController, type: :controller, authenticated: true do
  render_views

  describe 'GET index' do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "GET #index" do
      recipient1 = create(:recipient)
      recipient2 = create(:recipient)
      get :index
      expect(assigns(:recipients)).to match_array([recipient1,recipient2])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested recipient to @recipient" do
      recipient1 = create(:recipient)
      get :show, id: recipient1.id
      expect(assigns(:recipient)).to eq(recipient1)
    end

    it "renders the #show view" do
      get :show, id: create(:recipient)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new recipient as @recipient" do
      get :new
      assigns(:recipient).should be_a_new(Recipient)
    end
  end

  describe "GET #edit" do
    it "assigns the requested recipient as @recipient" do
      recipient = create(:recipient)
      get :edit, id: recipient.id
      assigns(:recipient).should eq(recipient)
    end

    it "renders the #edit view" do
      get :edit, id: create(:recipient)
      response.should render_template :edit
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new Recipient" do
        recipient = create(:recipient)
        mapping = create(:mapping)
        template = create(:notify_template)

        expect{
          post :create, recipient: attributes_for(:recipient)
        }.to change(Recipient, :count).by(1)
      end

      it "redirects to the new recipient" do
        recipient = create(:recipient)
        mapping = create(:mapping)
        template = create(:notify_template)
        post :create, recipient: attributes_for(:recipient)
        response.should redirect_to Recipient.last
      end

      # it "assigns a newly created recipient as @recipient" do
      #   post :create, recipient:
      #   assigns(:recipient).should be_a_new(Recipient)
      #   assigns(:recipient).should be_persisted
      # end

      # it "redirects to the created recipient" do
      #     post :create, recipient:
      #     response.should redirect_to(Recipient.last)
      # end
    end

    context "with valid attributes" do
      it "does not save the new recipient" do
        recipient = create(:recipient)
        mapping = create(:mapping)
        template = create(:notify_template)
        expect{
          post :create, recipient: attributes_for(:recipient, group_number: nil)
        }.to_not change(Recipient, :count)
      end

      it "re-renders the new method" do
        recipient = create(:recipient)
        mapping = create(:mapping)
        template = create(:notify_template)
        post :create, recipient: attributes_for(:recipient, group_number: nil)
        response.should render_template :new
      end
    end
  end


  describe 'PUT update' do
    before :each do
      @recipient = create(:recipient, group_number: 777)
    end

    context "valid attributes" do
      it "located the requested @recipient" do
        put :update, id: @recipient, recipient: attributes_for(:recipient)
        assigns(:recipient).should eq(@recipient)
      end

      it "changes @recipient's attributes" do
        put :update, id: @recipient,
        recipient: attributes_for(:recipient, group_number: 777)
        @recipient.reload
        @recipient.group_number.should eq(777)
      end

      it "redirects to the updated recipient" do
        put :update, id: @recipient, recipient: attributes_for(:recipient)
        response.should redirect_to @recipient
      end
    end

    context "invalid attributes" do
      it "locates the request @recipient" do
        put :update, id: @recipient, recipient: attributes_for(:recipient, group_number: nil)
        assigns(:recipient).should eq(@recipient)
      end

      it "does not changes @recipient's attributes" do
        put :update, id: @recipient,
        recipient: attributes_for(:recipient, group_number: nil)
        @recipient.reload
        @recipient.group_number.should eq(777)
      end

      it "re-renders the edit method" do
        put :update, id: @recipient, recipient: attributes_for(:recipient, group_number: nil)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @recipient = create(:recipient)
    end

    it "deletes the recipient" do
      expect{
        delete :destroy, id: @recipient
      }.to change(Recipient, :count).by(-1)
    end

    it "redirects to recipient#index" do
      delete :destroy, id: @recipient
      response.should redirect_to recipients_url(:only_path => true)
    end
  end
end
