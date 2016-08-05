require 'spec_helper'

describe RecurrencesController, type: :controller, authenticated: true do
  render_views

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
        lambda{ post :create, recurrence: attributes_for(:invalid_recurrencer) }
      }.to_not change(Recurrence,:count)
    end

    it 'render recurrence_new_path' do
      allow_any_instance_of(Recurrence).to receive(:save).and_return(false)
      post :create, recurrence: attributes_for(:invalid_recurrence)  
      response.should render_template :new
    end
  end

  context 'PUT update' do
    it "recurrence not equal recurrence" do
      recurrence1 = create(:recurrence)
      recurrence2 = create(:recurrence_with_repetitions, count: 4)
      put :update, id: recurrence1
      expect(assigns(recurrence1)).to_not eq (recurrence2)
    end

    it "changes recurrence's attributes" do
      Recurrence.delete_all
      recurrence = create(:recurrence)
      Recurrence.count.should eq 1
      put :update, id: recurrence, recurrence: attributes_for(:recurrence_with_2_repetitions)
      recurrence.reload
      pending 'recurrence.repetition.should be changed'
      recurrence.count.should eq 3
    end

    it 'redirects to the updated recurrence' do
      put :update, id: create(:recurrence), recurrence: attributes_for(:recurrence_with_2_repetitions)
      response.should redirect_to :recurrence
    end

    it 'render recurrence_edit_path when invalid_recurrence' do
      recurrence = create(:recurrence)
      rec_double = double 'recurrence'
      allow(Recurrence).to receive(:find).with(recurrence.id.to_s).and_return(rec_double)
      recurrence_attributes = attributes_for(:invalid_recurrence)
      expect(rec_double).to receive(:update_attributes).with(recurrence_attributes).and_return(false)
      put :update, id: recurrence.id, recurrence: recurrence_attributes
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
      response.should redirect_to recurrences_url(:only_path => true)
    end
  end
end