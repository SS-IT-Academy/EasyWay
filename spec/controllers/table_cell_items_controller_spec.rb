require 'spec_helper'

describe TableCellItemsController, type: :controller, authenticated: true do
  render_views

  before(:each) do
    @table_template = create(:table_template)
  end

  context "GET index" do
    it "table_cell_item should include table_cell_items" do
      table_cell_item1 = create(:table_cell_item, table_template: @table_template)
      table_cell_item2 = create(:table_cell_item, table_template: @table_template)
      table_cell_item3 = create(:table_cell_item, table_template: create(:table_template))
      get :index, table_template_id: @table_template.id
      expect(assigns(:table_cell_items)).to eq([table_cell_item1,table_cell_item2])
    end

    it "expected response from index page" do
      get :index, table_template_id: @table_template.id
      expect(response).to render_template(:index)
    end
  end
  
  context "GET show" do
    it "table_cell_item should be equal table_cell_item" do
      table_cell_item = create(:table_cell_item, table_template_id: @table_template.id)
      get :show, id: table_cell_item
      expect(assigns(:table_cell_item)).to eq(table_cell_item)
    end
    
    it "expected response from show page" do
      get :show, id: create(:table_cell_item, table_template_id: @table_template.id)
      expect(response).to render_template(:show)
    end
  end
  
  context "GET edit" do
    it 'table_cell_item equal table_cell_item' do
      table_cell_item = create(:table_cell_item, table_template_id: @table_template.id)
      get :edit, id: table_cell_item, table_template_id: @table_template.id
      expect(assigns(:table_cell_item)).to eq(table_cell_item)
    end

    it 'render edit page' do
      get :edit, id: create(:table_cell_item, table_template_id: @table_template.id), table_template_id: @table_template.id
      expect(response).to render_template(:edit)
    end
  end
  
  context "POST create" do
    let(:attributes) do 
      attributes_for(:table_cell_item,
        table_template_id: @table_template.id,
        resource_type_id: create(:resource_type).id
      )
    end

    it "expected creating new TableCellItem" do
      expect{
        post :create, table_cell_item: attributes 
      }.to change(TableCellItem,:count).by(1)
    end
        
    it "redirects to the new TableCellItem" do
      post :create, table_cell_item: attributes
      response.should redirect_to TableCellItem.last
    end
    
    it "does not create new TableCellItem" do
      expect{
        post :create, table_cell_item: attributes_for(:invalid_table_cell_item)
      }.to_not change(TableCellItem,:count)
    end
    
    it "render new action page" do
      post :create, table_cell_item: attributes_for(:invalid_table_cell_item)
      response.should render_template :new
    end
  end

  context "PUT update" do 
    it "table_cell_item should be equal table_cell_item" do
      table_cell_item = create(:table_cell_item, table_template_id: @table_template.id)
      put :update, id: table_cell_item
      assigns(:table_cell_item).should eq(table_cell_item)
    end
      
    it "table_cell_item should not be equal table_cell_item" do
      table_cell_item1 = create(:table_cell_item, table_template_id: @table_template.id)
      table_cell_item2 = create(:table_cell_item, table_template_id: @table_template.id)
      put :update, id: table_cell_item1
      expect(assigns(:table_cell_item1)).to_not eq (table_cell_item2)
    end
    
    it "changes table_cell_item's attributes" do
      table_cell_item = create(:table_cell_item, table_template_id: @table_template.id)
      new_table_template = create(:table_template)
      new_resource_type = create(:resource_type)
      put :update, id: table_cell_item, table_cell_item: attributes_for(:table_cell_item,
        resource_type_id: new_resource_type.id,
        table_template_id: new_table_template.id
      )
      table_cell_item.reload
      table_cell_item.resource_type_id.should eq(new_resource_type.id)
      table_cell_item.table_template_id.should eq(new_table_template.id)
    end
        
    it "redirects to the updated table_cell_item" do
      put :update, id: create(:table_cell_item), table_cell_item: attributes_for(:table_cell_item, table_template_id: @table_template.id)
      response.should redirect_to :table_cell_item
    end
    
    it 'render table_cell_item when invalid_table_cell_item' do
      put :update, id: create(:table_cell_item), table_cell_item: attributes_for(:invalid_table_cell_item)
      response.should render_template :edit
    end
  end
  
  context "DELETE destroy" do
    it "deletes table_cell_item" do 
      table_cell_item = create(:table_cell_item)
      expect{
        delete :destroy, id: table_cell_item
      }.to change(TableCellItem,:count).by(-1)
    end
        
    it "redirects to table_cell_item_url" do
      delete :destroy, id: create(:table_cell_item)
      response.should redirect_to table_cell_items_url(:only_path => true)
    end
  end
end
