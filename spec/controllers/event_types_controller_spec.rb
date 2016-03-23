require 'spec_helper'

describe EventTypesController , type: :controller, authenticated: true do
  context "GET index" do

    it "event_type should include event_type" do
      event_type1 = create(:event_type)
      event_type2 = create(:event_type)
      get :index
      expect(assigns(:event_types)).to eq([event_type1,event_type2])
    end

    it "expected response from index page" do
      get :index
      expect(response).to render_template(:index)
    end

  end

  context "GET show" do

    it "event_type should be equal event_type" do
      event_type = create(:event_type)
      get :show, id: event_type
      expect(assigns(:event_type)).to eq(event_type)
    end

    it "expected response from show page" do
      get :show, id: create(:event_type)
      expect(response).to render_template(:show)
    end

  end

  context "GET new" do

    it "event_type should not be a new EventType" do
      get :new
      expect(assigns(:event_types)).to_not be_a_new(EventType)
    end

    it "event_type should be a new EventType" do
      get :new
      expect(assigns(:event_type)).to be_a_new(EventType)
    end

    it "unexpected response from new page" do
      get :new
      expect(response).to_not render_template(:news)
    end

    it "expected response from new page" do
      get :new
      expect(response).to render_template(:new)
    end

    context "GET edit" do

      it 'event_type equal event_type' do
        event_type = create(:event_type)
        get :edit, id: event_type
        expect(assigns(:event_type)).to eq(event_type)
      end

      it 'render edit page' do
        get :edit, id: create(:event_type)
        expect(response).to render_template(:edit)
      end

    end

    context "POST create" do

      it "expected creating new EventType" do
        expect{
          post :create, event_type: attributes_for(:event_type)
        }.to change(EventType,:count).by(1)
      end

      it "redirect to the new EventType" do
        post :create, event_type: attributes_for(:event_type)
        response.should redirect_to EventType.last
      end

      it "does not create new EventType" do
        expect{
          post :create, event_type: attributes_for(:invalid_event_type)
        }.to_not change(EventType,:count)
      end

      it "render new action page" do
        post :create, event_type: attributes_for(:invalid_event_type)
        response.should render_template :new
      end

    end

    context "PUT update" do

      it "event_type should be equal event_type" do
        event_type = create(:event_type)
        put :update, id: event_type
        assigns(:event_type).should eq(event_type)
      end

      it "event_type should not be equal event_type" do
        event_type1 = create(:event_type)
        event_type2 = create(:event_type)
        put :update, id: event_type1
        expect(assigns(:event_type1)).to_not eq (event_type2)
      end

      it "changes event_type's attributes" do
        event_type = create(:event_type)
        put :update, id: event_type, event_type: attributes_for(:event_type, name: "some name" )
        event_type.reload
        event_type.name.should eq("some name")
      end

      it "redirects to the updated event_type" do
        put :update, id: create(:event_type), event_type: attributes_for(:event_type, name: "some name")
        response.should redirect_to :event_type
      end

      it 'render event_type_edit_path when invalid_event_type' do
        put :update, id: create(:event_type), event_type: attributes_for(:invalid_event_type)
        response.should render_template :edit
      end

    end

    context "DELETE destroy" do

      it "deletes event_type" do 
        event_type = create(:event_type)
        expect{
          delete :destroy, id: event_type
        }.to change(EventType,:count).by(-1)
      end

      it "redirects to event_type_url" do
        delete :destroy, id: create(:event_type)
        response.should redirect_to event_types_url
      end

    end

  end

end