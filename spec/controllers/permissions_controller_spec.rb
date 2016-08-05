require 'spec_helper'

describe PermissionsController, type: :controller, authenticated: true  do
	include RSpec::Rails::ControllerExampleGroup
  render_views

	context 'GET index' do
		it 'permissions should include all permission' do
			permission1 = create(:permission)
			permission2 = create(:permission, name: 4)
			get :index
			expect(assigns(:permissions)).to eq([permission1, permission2])
		end

		it 'render all permissions' do
			get :index
			expect(response).to render_template :index
		end
	end

	let(:permission) {create(:permission)}

	context 'GET show' do
		it 'permission equal permission' do
			get :show, id: permission
			expect(assigns(:permission)).to eq(permission)
		end

		it "expected response from show page" do
      get :show, id: permission
      expect(response).to render_template(:show)
    end
	end

	context 'GET new' do
		it 'should be a new Permission' do
			get :new
			expect(assigns(:permission)).to be_a_new(Permission)
		end

		it 'should not be a neww Permission' do
			get :new
			expect(assigns(:invalid_permission)).to_not be_a_new(Permission)
		end

		it 'expect response from new page' do
			get :new
			expect(response).to render_template(:new)
		end

		it 'unexpect response from this page' do
			get :new
			expect(response).to_not render_template(:newed)
		end
	end

	context 'GET edit' do
		it 'permission equal permission' do
			get :edit, id: permission
			expect(assigns(:permission)).to eq(permission)
		end

		it 'response to edit' do
			get :edit, id: permission
			expect(response).to render_template(:edit)
		end

		it 'render edit page' do
      get :edit, id: permission
      expect(response).to render_template(:edit)
    end
	end

	context 'POST create' do
		it 'create new Permission' do
			expect{
				post :create, permission: attributes_for(:permission)
			}.to change(Permission, :count).by(1)
		end

		it "redirect to the new Permission" do
      post :create, permission: attributes_for(:permission)
      response.should redirect_to Permission.last
    end

    # it "render new action page" do
    #   post :create, permission: attributes_for(:permission, name: nil)
    #   response.should render_template(:new)
    # end
	end

	context 'PUT update' do
		it 'permission equal permission' do
			put :update, id: permission, permission: attributes_for(:permission, name: 8)
			expect(assigns(:permission)).to eq(permission)
		end

		it "redirects to the updated permission" do
      put :update, id: create(:permission), permission: attributes_for(:permission, name: 7)
      response.should redirect_to :permission
    end

     # it 'render permissions_path when invalid permission' do
     #    put :update, id: permission, event_type: attributes_for(:permission, name: nil)
     #    response.should render_template :edit
     #  end
	end

	context 'DELETE destroy' do
		# it 'deletes permission' do
		# 	expect{
		# 		delete :destroy, id: permission
		# 	}.to change(Permission, :count).by(-1)
		# end

		# it 'redirects to permissions url' do
		# 	delete :destroy, id: permission
		# 	response.should redirect_to permissions_url(:only_path => true)
		# end
	end
end