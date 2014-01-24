require 'spec_helper'

describe UsersController do
  
  context 'GET index' do

    it "assigns Users" do
      user1 = create(:user)
      user2 = create(:user)
      role1 = create(:role)
      role2 = create(:role)
      get :index
      expect(assigns(:users)).to eq([user1, user2])
      expect(assigns(:roles)).to eq([role1, role2])
    end

    it "render index page" do
      get :index
      expect(response).to render_template(:index)
    end

  end

  context "GET get_recipients" do
    it "assigns recipients" do
      user1 = create(:user)
      user2 = create(:user)
      get :get_recipients
      expect(assigns(:users)).to eq([user1, user2])
    end
  end



  context 'GET show' do

    it 'assigns user' do
      user1 = create(:user)
      get :show, id: user1
      expect(assigns(:user)).to eq(user1)
    end

    it 'render show page' do
      get :show, id: create(:user)
      expect(response).to render_template(:show)
    end
  end
 
  context "GET new" do

    it "assigns a new User to @user " do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
    
     it 'expected response from new page' do
       get :new, id: create(:user)
       expect(response).to render_template(:new)
     end
  end

  context "GET edit" do
  
   
  end

describe 'PUT update' do
  
  before :each do
    @user = create(:user)
  end

  context "valid attributes" do 

    it "located the requested @user" do 
      put :update, id: @user, user: attributes_for(:user) 
      assigns(:user).should eq(@user)
    end

    it "changes @user's attributes" do 
      put :update, id: @user, user: attributes_for(:user, username: "updated username") 
      @user.reload 
      @user.username.should eq("updated username") 
    end

    it "redirects to the updated user" do
      put :update, id: @user, user: attributes_for(:user) 
      response.should redirect_to @user
    end
  end

  context "invalid attributes" do

    it "locates the requested @user" do
      put :update, id: @user, user: attributes_for(:invalid_user) 
      assigns(:user).should eq(@user) 
    end

    it "does not change @user's attributes" do
      @user2 = create(:user, username: "vasya_user")
      put :update, id: @user2, user: attributes_for(:invalid_user) 
      @user2.reload 
      @user2.username.should eq("vasya_user")
    end
    
    it "re-renders the edit method" do
      put :update, id: @user, user: attributes_for(:invalid_user)
      response.should render_template :edit 
    end
  end
end

  context "DELETE destroy" do

    it "destroys user" do
      user1 = create(:user)
      expect {
        delete :destroy, id: user1
        }.to change(User, :count).by(-1)
    end

    it "redirects to the users#index" do
      user1 = create(:user)
      delete :destroy, id: user1
      response.should redirect_to(users_path)
    end
  end

end
