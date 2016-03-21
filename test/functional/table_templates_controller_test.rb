require 'test_helper'

class TableTemplatesControllerTest < ActionController::TestCase
  setup do
    @table_template = table_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:table_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create table_template" do
    assert_difference('TableTemplate.count') do
      post :create, table_template: { cell_body: @table_template.cell_body, name: @table_template.name }
    end

    assert_redirected_to table_template_path(assigns(:table_template))
  end

  test "should show table_template" do
    get :show, id: @table_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @table_template
    assert_response :success
  end

  test "should update table_template" do
    put :update, id: @table_template, table_template: { cell_body: @table_template.cell_body, name: @table_template.name }
    assert_redirected_to table_template_path(assigns(:table_template))
  end

  test "should destroy table_template" do
    assert_difference('TableTemplate.count', -1) do
      delete :destroy, id: @table_template
    end

    assert_redirected_to table_templates_path
  end
end
