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

describe ValidatorsController , type: :controller, authenticated: true do# This should return the minimal set of attributes required to create a valid
  # Validator. As you add validations to Validator, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { 
    name: "MyString",
    body: "!@@",
    message: "Error Message!"
  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ValidatorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all validators as @validators" do
      validator = Validator.create! valid_attributes
      get :index, {}, valid_session
      assigns(:validators).should eq([validator])
    end
  end

  describe "GET show" do
    it "assigns the requested validator as @validator" do
      validator = Validator.create! valid_attributes
      get :show, {:id => validator.to_param}, valid_session
      assigns(:validator).should eq(validator)
    end
  end

  describe "GET new" do
    it "assigns a new validator as @validator" do
      get :new, {}, valid_session
      assigns(:validator).should be_a_new(Validator)
    end
  end

  describe "GET edit" do
    it "assigns the requested validator as @validator" do
      validator = Validator.create! valid_attributes
      get :edit, {:id => validator.to_param}, valid_session
      assigns(:validator).should eq(validator)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Validator" do
        expect {
          post :create, {:validator => valid_attributes}, valid_session
        }.to change(Validator, :count).by(1)
      end

      it "assigns a newly created validator as @validator" do
        post :create, {:validator => valid_attributes}, valid_session
        assigns(:validator).should be_a(Validator)
        assigns(:validator).should be_persisted
      end

      it "redirects to the created validator" do
        post :create, {:validator => valid_attributes}, valid_session
        response.should redirect_to(Validator.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved validator as @validator" do
        # Trigger the behavior that occurs when invalid params are submitted
        Validator.any_instance.stub(:save).and_return(false)
        post :create, {:validator => { "name" => "invalid value" }}, valid_session
        assigns(:validator).should be_a_new(Validator)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Validator.any_instance.stub(:save).and_return(false)
        post :create, {:validator => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested validator" do
        validator = Validator.create! valid_attributes
        # Assuming there are no other validators in the database, this
        # specifies that the Validator created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Validator.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => validator.to_param, :validator => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested validator as @validator" do
        validator = Validator.create! valid_attributes
        put :update, {:id => validator.to_param, :validator => valid_attributes}, valid_session
        assigns(:validator).should eq(validator)
      end

      it "redirects to the validator" do
        validator = Validator.create! valid_attributes
        put :update, {:id => validator.to_param, :validator => valid_attributes}, valid_session
        response.should redirect_to(validator)
      end
    end

    describe "with invalid params" do
      it "assigns the validator as @validator" do
        validator = Validator.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Validator.any_instance.stub(:save).and_return(false)
        put :update, {:id => validator.to_param, :validator => { "name" => "invalid value" }}, valid_session
        assigns(:validator).should eq(validator)
      end

      it "re-renders the 'edit' template" do
        validator = Validator.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Validator.any_instance.stub(:save).and_return(false)
        put :update, {:id => validator.to_param, :validator => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested validator" do
      validator = Validator.create! valid_attributes
      expect {
        delete :destroy, {:id => validator.to_param}, valid_session
      }.to change(Validator, :count).by(-1)
    end

    it "redirects to the validators list" do
      validator = Validator.create! valid_attributes
      delete :destroy, {:id => validator.to_param}, valid_session
      response.should redirect_to(validators_url(:only_path => true))
    end
  end

end
