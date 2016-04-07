require 'spec_helper'

describe TableFiltersController , type: :controller, authenticated: true do
  context "GET index" do

    it "table_filters should include table_filter" do
      table_filter1 = create(:table_filter)
      table_filter2 = create(:table_filter)
      get :index
      expect(assigns(:table_filters)).to eq([table_filter1,table_filter2])
    end

    it "expected response from index page" do
      get :index
      expect(response).to render_template(:index)
    end

  end
  
  context "GET show" do

    it "table_filter should be equal table_filter" do
      table_filter = create(:table_filter)
      get :show, id: table_filter
      expect(assigns(:table_filter)).to eq(table_filter)
    end

    it "expected response from show page" do
      get :show, id: create(:table_filter)
      expect(response).to render_template(:show)
    end

  end
  
  context "GET edit" do

    it 'table_filter equal table_filter' do
      table_filter = create(:table_filter)
      get :edit, id: table_filter
      expect(assigns(:table_filter)).to eq(table_filter)
    end

    it 'render edit page' do
      get :edit, id: create(:table_filter)
      expect(response).to render_template(:edit)
    end

  end
  
  
  context "POST create" do

    it "expected creating new TableFilter" do
      expect{
        post :create, table_filter: attributes_for(:table_filter)
      }.to change(TableFilter,:count).by(1)
    end

    it "redirects to the new TableFilter" do
      post :create, table_filter: attributes_for(:table_filter)
      response.should redirect_to TableFilter.last
    end

    it "does not create new TableFilter" do
      expect{
        post :create, table_filter: attributes_for(:invalid_table_filter)
      }.to_not change(TableFilter,:count)
    end

    it "render new action page" do
      post :create, table_filter: attributes_for(:invalid_table_filter)
      response.should render_template :new
    end

  end
  
  
  context "PUT update" do

    it "table_filter should be equal table_filter" do
      table_filter = create(:table_filter)
      put :update, id: table_filter
      assigns(:table_filter).should eq(table_filter)
    end

    it "table_filter should not be equal table_filter" do
      table_filter1 = create(:table_filter)
      table_filter2 = create(:table_filter)
      put :update, id: table_filter1
      expect(assigns(:table_filter1)).to_not eq (table_filter2)
    end

    it "changes table_filter's attributes" do
      table_filter = create(:table_filter)
      put :update, id: table_filter, table_filter: attributes_for(:table_filter,
        resource_id: 3,
        table_template_id: 4
      )
      table_filter.reload
      table_filter.resource_id.should eq(3)
      table_filter.table_template_id.should eq(4)
    end

    it "redirects to the updated table_filter" do
      put :update, id: create(:table_filter), table_filter: attributes_for(:table_filter, table_template_id: 8)
      response.should redirect_to :table_filter
    end

    it 'render table_filter_edit_path when invalid_table_filter' do
      put :update, id: create(:table_filter), table_filter: attributes_for(:invalid_table_filter)
      response.should render_template :edit
    end

  end


  context "DELETE destroy" do

    it "deletes table_filter" do 
      table_filter = create(:table_filter)
      expect{
        delete :destroy, id: table_filter
      }.to change(TableFilter,:count).by(-1)
    end

    it "redirects to table_filter_url" do
      delete :destroy, id: create(:table_filter)
      response.should redirect_to table_filters_url(:only_path => true)
    end

  end
  
end
