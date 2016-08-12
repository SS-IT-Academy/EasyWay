require 'spec_helper'

describe BookmarksController, type: :controller, authenticated: true do
  render_views

  context 'GET index' do
    it "assigns bookmarks" do
      bookmark1 = create(:bookmark)
      bookmark2 = create(:bookmark)
      get :index
      expect(assigns(:bookmarks)).to eq([bookmark1,bookmark2])
    end

    it "render index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end 

  context 'GET show' do
    it 'assigns bookmark' do
      bookmark = create(:bookmark)
      get :show, id: bookmark
      expect(assigns(:bookmark)).to eq(bookmark)
    end

    it 'render show page' do
      get :show, id: create(:bookmark)
      expect(response).to render_template(:show)
    end
  end

  context "GET new" do
    it "bookmark should be a new Bookmark" do
      get :new
      expect(assigns(:bookmark)).to be_a_new(Bookmark)
    end
    
     it 'expected response from new page' do
       get :new, id: create(:bookmark)
       expect(response).to render_template('new')
     end
  end
    
  context "GET edit" do
    it 'expect edit page' do
      bookmark = create(:bookmark)
      get :edit,  id: bookmark
      expect(response).to render_template('edit')
    end
  end

  context "POST create" do
    it 'created new Bookmark' do
      expect{
        post :create, bookmark: attributes_for(:bookmark)
      }.to change(Bookmark, :count).by(1)
    end

    it "redirects to the new bookmark" do
      post :create, bookmark: attributes_for(:bookmark)
      response.should redirect_to Bookmark.last
    end

    it 'does not create new bookmark' do
      expect{
        post :create, bookmark: attributes_for(:invalid_bookmark)
        }.to_not change(Bookmark,:count)
    end

    it 'render events_new_path' do
      post :create, bookmark: attributes_for(:invalid_bookmark)
      response.should render_template :new
    end
  end


  context "DELETE destroy" do
    it "destroys the requested bookmark" do
      bookmark = create(:bookmark)
      expect {
        delete :destroy, id: bookmark 
        }.to change(Bookmark, :count).by(-1)
    end

    it "redirects to the bookmarks list" do
      bookmark = create(:bookmark)
      delete :destroy, id: bookmark
      response.should redirect_to(bookmarks_url(:only_path => true))
    end
  end

  describe 'PUT update' do
    before :each do
      @bookmark = create(:bookmark, url: "urla", title: "some title")
    end

    context "valid attributes" do 
      it "located the requested @bookmark" do 
        put :update, id: @bookmark, bookmark: attributes_for(:bookmark) 
        assigns(:bookmark).should eq(@bookmark)
      end

      it "changes @bookmark's attributes" do 
        put :update, id: @bookmark, bookmark: attributes_for(:bookmark, url: "urla", title: "new(updated) title") 
        @bookmark.reload 
        @bookmark.url.should eq("urla") 
        @bookmark.title.should eq("new(updated) title")
      end

      it "redirects to the updated bookmark" do
        put :update, id: @bookmark, bookmark: attributes_for(:bookmark) 
        response.should redirect_to @bookmark
      end
    end

    context "invalid attributes" do
      it "locates the requested @bookmark" do
        put :update, id: @bookmark, bookmark: attributes_for(:invalid_bookmark) 
        assigns(:bookmark).should eq(@bookmark) 
      end

      it "does not change @bookmark's attributes" do
        put :update, id: @bookmark, bookmark: attributes_for(:bookmark, url: "urla", title: nil) 
        @bookmark.reload 
        @bookmark.url.should eq("urla") 
        @bookmark.title.should eq("some title") 
      end
      
      it "re-renders the edit method" do
        put :update, id: @bookmark, bookmark: attributes_for(:invalid_bookmark)
        response.should render_template :edit 
      end
    end
  end
end
