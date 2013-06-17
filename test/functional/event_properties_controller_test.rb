require 'test_helper'

class EventPropertiesControllerTest < ActionController::TestCase
  setup do
    @event_property = event_properties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_properties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_property" do
    assert_difference('EventProperty.count') do
      post :create, event_property: { name: @event_property.name }
    end

    assert_redirected_to event_property_path(assigns(:event_property))
  end

  test "should show event_property" do
    get :show, id: @event_property
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_property
    assert_response :success
  end

  test "should update event_property" do
    put :update, id: @event_property, event_property: { name: @event_property.name }
    assert_redirected_to event_property_path(assigns(:event_property))
  end

  test "should destroy event_property" do
    assert_difference('EventProperty.count', -1) do
      delete :destroy, id: @event_property
    end

    assert_redirected_to event_properties_path
  end
end
