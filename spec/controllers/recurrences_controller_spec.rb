require 'spec_helper'

describe RecurrencesController do

  context 'GET index' do

    it 'recurrences should include recurrence' do
      recurrence1 = create(:recurrence)
      recurrence2 = create(:recurrence)
      get :index
      expect(assigns(:recurrences)).to eq([recurrence1, recurrence2])
    end

    it 'render index page' do
      get :index
      expect(response).to render_template(:index)
    end

  end

  context 'GET show' do

    it 'recurrence equal recurrence' do
      recurrence = create(:recurrence)
      get :show, id: recurrence
      expect(assigns(:recurrence)).to eq(recurrence)
    end

    it 'render show page' do 
      get :show, id: create(:recurrence)
      expect(response).to render_template(:show)
    end

  end

  context "GET new" do

    it 'recurrence should be a new Recurrence' do
      get :new
      expect(assigns(:recurrence)).to be_a_new(Recurrence)
    end

    it 'recurrence should not be a new Recurrence' do
      get :new
      expect(assigns(:recurrences)).to_not be_a_new(Recurrence)
    end

    it 'render new page' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'not render new page' do
      get :new
      expect(response).to_not render_template(:news)
    end

  end

  context "GET edit" do

    it 'recurrence equal recurrence' do
      recurrence = create(:recurrence)
      get :edit, id: recurrence
      expect(assigns(:recurrence)).to eq(recurrence)
    end

    it 'render edit page' do
      get :edit, id: create(:recurrence)
      expect(response).to render_template(:edit)
    end

  end

  context "POST create" do

    it 'create new Recurrence' do
      expect{
        post :create, recurrence: attributes_for(:recurrence)
      }.to change(Recurrence,:count).by(1)
    end

    it 'redirect to the new Recurrence' do
      post :create, recurrence: attributes_for(:recurrence)
      response.should redirect_to Recurrence.last
    end

    it 'does not create new Recurrence' do
      expect{
        post :create, recurrence: attributes_for(:invalid_recurrence)
      }.to_not change(Recurrence,:count)
    end

    it 'render recurrence_new_path' do
      post :create, recurrence: attributes_for(:invalid_recurrence)
      response.should render_template :new
    end

  end

  context 'PUT update' do

    it "recurrence not equal recurrence" do
      recurrence1 = create(:recurrence)
      recurrence2 = create(:recurrence, repetition: "4")
      put :update, id: recurrence1
      expect(assigns(recurrence1)).to_not eq (recurrence2)
    end

    it "changes recurrence's attributes" do
      recurrence = create(:recurrence)
      put :update, id: recurrence, recurrence: attributes_for(:recurrence,
        start_date: DateTime.now.utc - 1.day,
        end_date: DateTime.now.utc + 4.day
      )
      recurrence.reload
      recurrence.start_date.should == DateTime.now.utc - 1.day
      recurrence.end_date.should eq(DateTime.now.utc + 4.day)
    end

    it 'redirects to the updated recurrence' do
      put :update, id: create(:recurrence), recurrence: attributes_for(:recurrence, repetition: "4")
      response.should redirect_to :recurrence
    end

    it 'render recurrence_edit_path when invalid_recurrence' do
      put :update, id: create(:recurrence), recurrence: attributes_for(:invalid_recurrence)
      response.should render_template :edit
    end

  end

  context "DELETE destroy" do

    it 'deletes recurrence' do
      recurrence = create(:recurrence)
      expect{
        delete :destroy, id: recurrence
      }.to change(Recurrence,:count).by(-1)
    end

    it 'redirects to recurrences_url' do
      delete :destroy, id: create(:recurrence)
      response.should redirect_to recurrences_url
    end
  end

end