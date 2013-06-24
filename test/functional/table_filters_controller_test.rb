require 'test_helper'

class TableFiltersControllerTest < ActionController::TestCase
  setup do
    @table_filter = table_filters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:table_filters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create table_filter" do
    assert_difference('TableFilter.count') do
      post :create, table_filter: { delimiter: @table_filter.delimiter, position_float: @table_filter.position_float, position_num: @table_filter.position_num, resource_id: @table_filter.resource_id, table_template_id: @table_filter.table_template_id }
    end

    assert_redirected_to table_filter_path(assigns(:table_filter))
  end

  test "should show table_filter" do
    get :show, id: @table_filter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @table_filter
    assert_response :success
  end

  test "should update table_filter" do
    put :update, id: @table_filter, table_filter: { delimiter: @table_filter.delimiter, position_float: @table_filter.position_float, position_num: @table_filter.position_num, resource_id: @table_filter.resource_id, table_template_id: @table_filter.table_template_id }
    assert_redirected_to table_filter_path(assigns(:table_filter))
  end

  test "should destroy table_filter" do
    assert_difference('TableFilter.count', -1) do
      delete :destroy, id: @table_filter
    end

    assert_redirected_to table_filters_path
  end
end
