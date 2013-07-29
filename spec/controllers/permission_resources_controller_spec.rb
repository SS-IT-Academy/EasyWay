require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PermissionResourcesController do

  # This should return the minimal set of attributes required to create a valid
  # PermissionResource. As you add validations to PermissionResource, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "role_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PermissionResourcesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all permission_resources as @permission_resources" do
      permission_resource = PermissionResource.create! valid_attributes
      get :index, {}, valid_session
      assigns(:permission_resources).should eq([permission_resource])
    end
  end

  describe "GET show" do
    it "assigns the requested permission_resource as @permission_resource" do
      permission_resource = PermissionResource.create! valid_attributes
      get :show, {:id => permission_resource.to_param}, valid_session
      assigns(:permission_resource).should eq(permission_resource)
    end
  end

  describe "GET new" do
    it "assigns a new permission_resource as @permission_resource" do
      get :new, {}, valid_session
      assigns(:permission_resource).should be_a_new(PermissionResource)
    end
  end

  describe "GET edit" do
    it "assigns the requested permission_resource as @permission_resource" do
      permission_resource = PermissionResource.create! valid_attributes
      get :edit, {:id => permission_resource.to_param}, valid_session
      assigns(:permission_resource).should eq(permission_resource)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PermissionResource" do
        expect {
          post :create, {:permission_resource => valid_attributes}, valid_session
        }.to change(PermissionResource, :count).by(1)
      end

      it "assigns a newly created permission_resource as @permission_resource" do
        post :create, {:permission_resource => valid_attributes}, valid_session
        assigns(:permission_resource).should be_a(PermissionResource)
        assigns(:permission_resource).should be_persisted
      end

      it "redirects to the created permission_resource" do
        post :create, {:permission_resource => valid_attributes}, valid_session
        response.should redirect_to(PermissionResource.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved permission_resource as @permission_resource" do
        # Trigger the behavior that occurs when invalid params are submitted
        PermissionResource.any_instance.stub(:save).and_return(false)
        post :create, {:permission_resource => { "role_id" => "invalid value" }}, valid_session
        assigns(:permission_resource).should be_a_new(PermissionResource)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PermissionResource.any_instance.stub(:save).and_return(false)
        post :create, {:permission_resource => { "role_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested permission_resource" do
        permission_resource = PermissionResource.create! valid_attributes
        # Assuming there are no other permission_resources in the database, this
        # specifies that the PermissionResource created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PermissionResource.any_instance.should_receive(:update_attributes).with({ "role_id" => "1" })
        put :update, {:id => permission_resource.to_param, :permission_resource => { "role_id" => "1" }}, valid_session
      end

      it "assigns the requested permission_resource as @permission_resource" do
        permission_resource = PermissionResource.create! valid_attributes
        put :update, {:id => permission_resource.to_param, :permission_resource => valid_attributes}, valid_session
        assigns(:permission_resource).should eq(permission_resource)
      end

      it "redirects to the permission_resource" do
        permission_resource = PermissionResource.create! valid_attributes
        put :update, {:id => permission_resource.to_param, :permission_resource => valid_attributes}, valid_session
        response.should redirect_to(permission_resource)
      end
    end

    describe "with invalid params" do
      it "assigns the permission_resource as @permission_resource" do
        permission_resource = PermissionResource.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PermissionResource.any_instance.stub(:save).and_return(false)
        put :update, {:id => permission_resource.to_param, :permission_resource => { "role_id" => "invalid value" }}, valid_session
        assigns(:permission_resource).should eq(permission_resource)
      end

      it "re-renders the 'edit' template" do
        permission_resource = PermissionResource.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PermissionResource.any_instance.stub(:save).and_return(false)
        put :update, {:id => permission_resource.to_param, :permission_resource => { "role_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested permission_resource" do
      permission_resource = PermissionResource.create! valid_attributes
      expect {
        delete :destroy, {:id => permission_resource.to_param}, valid_session
      }.to change(PermissionResource, :count).by(-1)
    end

    it "redirects to the permission_resources list" do
      permission_resource = PermissionResource.create! valid_attributes
      delete :destroy, {:id => permission_resource.to_param}, valid_session
      response.should redirect_to(permission_resources_url)
    end
  end

end