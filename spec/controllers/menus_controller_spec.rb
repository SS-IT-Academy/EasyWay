require 'spec_helper'

describe MenusController , type: :controller, authenticated: true do
  context 'GET index' do

    it "assigns Menus" do
      menu1 = create(:menu)
      menu2 = create(:menu)
      get :index
      expect(assigns(:menus)).to eq([menu1, menu2])
    end

    it "render index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end 

  context "GET show" do

    it 'assigns menu' do
      menu = create(:menu)
      get :show, id: menu
      expect(assigns(:menu)).to eq(menu)
    end

    it 'render show page' do
      get :show, id: create(:menu)
      expect(response).to render_template(:show)
    end
  end

  context "GET edit" do

    it 'expect edit page' do
      menu = create(:menu)
      get :edit,  id: menu
      expect(response).to render_template('edit')
    end

    it "render the :edit template" do
      menu = create(:menu)
      get :edit, id: menu
      expect(response).to render_template :edit
    end
  end

  context "POST create" do
    
    it 'created new Menu' do
      expect{
        post :create, menu: attributes_for(:menu)
      }.to change(Menu, :count).by(1)
    end

    it "redirects to the new menu" do
      post :create, menu: attributes_for(:menu)
      response.should redirect_to Menu.last
    end
  end

describe 'PUT update' do
  
  before :each do
    @menu = create(:menu, position: "1")
  end

  context "valid attributes" do 

    it "located the requested @menu" do 
      put :update, id: @menu, menu: attributes_for(:menu) 
      assigns(:menu).should eq(@menu)
    end

    it "changes @menu's attributes" do 
      put :update, id: @menu, menu: attributes_for(:menu, position: "2") 
      @menu.reload 
      @menu.position.should eq(2) 
    end

    it "redirects to the updated menu" do
      put :update, id: @menu, menu: attributes_for(:menu) 
      response.should redirect_to @menu
    end
  end
end

context "DELETE destroy" do

    it "destroys the requested menu" do
      menu = create(:menu)
      expect {
        delete :destroy, id: menu 
        }.to change(Menu, :count).by(-1)
    end

    it "redirects to the menus list" do
      menu = create(:menu)
      delete :destroy, id: menu
      response.should redirect_to(menus_url)
    end

  end




end