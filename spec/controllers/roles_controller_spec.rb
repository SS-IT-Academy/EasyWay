require 'spec_helper'

describe RolesController do

  context 'GET index' do

    it "assigns Roles" do
      role1 = create(:role)
      role2 = create(:role)
      get :index
      expect(assigns(:roles)).to eq([role1, role2])
    end

    it "render index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end 


  context 'GET show' do

    it 'assigns role' do
      role1 = create(:role)
      get :show, id: role1
      expect(assigns(:role)).to eq(role1)
    end

    it 'render show page' do
      get :show, id: create(:role)
      expect(response).to render_template(:show)
    end
  end

  context "GET new" do

    it "assigns a new Role to @role " do
      get :new
      expect(assigns(:role)).to be_a_new(Role)
    end
    
     it 'expected response from new page' do
       get :new, id: create(:role)
       expect(response).to render_template(:new)
     end
  end

  context "GET edit" do
  
    it 'expect edit page' do
      role1 = create(:role)
      get :edit,  id: role1
      expect(response).to render_template(:edit)
    end
    
    it "assigns the request role to @role" do
      role1 = create(:role)
      get :edit, id: role1
      expect(assigns(:role)).to eq(role1)
    end
  end

  context "POST create" do
    
    it 'save the new role in the database' do
      expect{
        post :create, role: attributes_for(:role)
      }.to change(Role, :count).by(1)
    end

    it "redirects to the new role" do
      post :create, role: attributes_for(:role)
      response.should redirect_to Role.last
    end

    it 'does not save the new role in the database with invalid attributes' do
      expect{
        post :create, role: attributes_for(:invalid_role)
        }.to_not change(Role,:count)
    end
    
    it "re-renders the :new template" do
    	post :create, role: attributes_for(:invalid_role)
    	expect(response).to render_template('new')
    end
  end

  context "DELETE destroy" do

    it "destroys the role" do
      role1 = create(:role)
      expect {
        delete :destroy, id: role1
        }.to change(Role, :count).by(-1)
    end

    it "redirects to the roles#index" do
      role1 = create(:role)
      delete :destroy, id: role1
      response.should redirect_to(roles_path)
    end
  end


describe 'PUT update' do
  
  before :each do
    @role = create(:role)
  end

  context "valid attributes" do 

    it "located the requested @role" do 
      put :update, id: @role, role: attributes_for(:role) 
      assigns(:role).should eq(@role)
    end

    it "changes @role's attributes" do 
      put :update, id: @role, role: attributes_for(:role, name: "updated role") 
      @role.reload 
      @role.name.should eq("updated role") 
    end

    it "redirects to the updated role" do
      put :update, id: @role, role: attributes_for(:role) 
      response.should redirect_to @role
    end

  end

  context "invalid attributes" do

    it "locates the requested @role" do
      put :update, id: @role, role: attributes_for(:invalid_role) 
      assigns(:role).should eq(@role) 
    end

    it "does not change @role's attributes" do
      @role2 = create(:role, name: "vasya_role")
      put :update, id: @role2, role: attributes_for(:role, name: nil) 
      @role2.reload 
      @role2.name.should eq("vasya_role")
    end
    
    it "re-renders the edit method" do
      put :update, id: @role, role: attributes_for(:invalid_role)
      response.should render_template :edit 
    end

  end

end



end
