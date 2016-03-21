require 'test_helper'

class TableHeadersControllerTest < ActionController::TestCase
  setup do
    @table_header = table_headers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:table_headers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create table_header" do
    assert_difference('TableHeader.count') do
      post :create, table_header: { parent_id: @table_header.parent_id, position_num: @table_header.position_num, resource_type_id: @table_header.resource_type_id, table_template_id: @table_header.table_template_id }
    end

    assert_redirected_to table_header_path(assigns(:table_header))
  end

  test "should show table_header" do
    get :show, id: @table_header
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @table_header
    assert_response :success
  end

  test "should update table_header" do
    put :update, id: @table_header, table_header: { parent_id: @table_header.parent_id, position_num: @table_header.position_num, resource_type_id: @table_header.resource_type_id, table_template_id: @table_header.table_template_id }
    assert_redirected_to table_header_path(assigns(:table_header))
  end

  test "should destroy table_header" do
    assert_difference('TableHeader.count', -1) do
      delete :destroy, id: @table_header
    end

    assert_redirected_to table_headers_path
  end
end
