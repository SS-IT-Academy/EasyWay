require 'test_helper'

class TableCellItemsControllerTest < ActionController::TestCase
  setup do
    @table_cell_item = table_cell_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:table_cell_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create table_cell_item" do
    assert_difference('TableCellItem.count') do
      post :create, table_cell_item: { resource_type_id: @table_cell_item.resource_type_id, table_template_id: @table_cell_item.table_template_id }
    end

    assert_redirected_to table_cell_item_path(assigns(:table_cell_item))
  end

  test "should show table_cell_item" do
    get :show, id: @table_cell_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @table_cell_item
    assert_response :success
  end

  test "should update table_cell_item" do
    put :update, id: @table_cell_item, table_cell_item: { resource_type_id: @table_cell_item.resource_type_id, table_template_id: @table_cell_item.table_template_id }
    assert_redirected_to table_cell_item_path(assigns(:table_cell_item))
  end

  test "should destroy table_cell_item" do
    assert_difference('TableCellItem.count', -1) do
      delete :destroy, id: @table_cell_item
    end

    assert_redirected_to table_cell_items_path
  end
end
