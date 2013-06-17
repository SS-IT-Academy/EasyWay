require 'test_helper'

class NotifyTemplatesControllerTest < ActionController::TestCase
  setup do
    @notify_template = notify_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notify_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notify_template" do
    assert_difference('NotifyTemplate.count') do
      post :create, notify_template: { body: @notify_template.body, desc: @notify_template.desc, template_name: @notify_template.template_name }
    end

    assert_redirected_to notify_template_path(assigns(:notify_template))
  end

  test "should show notify_template" do
    get :show, id: @notify_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notify_template
    assert_response :success
  end

  test "should update notify_template" do
    put :update, id: @notify_template, notify_template: { body: @notify_template.body, desc: @notify_template.desc, template_name: @notify_template.template_name }
    assert_redirected_to notify_template_path(assigns(:notify_template))
  end

  test "should destroy notify_template" do
    assert_difference('NotifyTemplate.count', -1) do
      delete :destroy, id: @notify_template
    end

    assert_redirected_to notify_templates_path
  end
end
