require 'test_helper'

class NotifyEventsControllerTest < ActionController::TestCase
  setup do
    @notify_event = notify_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notify_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notify_event" do
    assert_difference('NotifyEvent.count') do
      post :create, notify_event: { event_id: @notify_event.event_id, name: @notify_event.name, observer_id: @notify_event.observer_id, template_id: @notify_event.template_id }
    end

    assert_redirected_to notify_event_path(assigns(:notify_event))
  end

  test "should show notify_event" do
    get :show, id: @notify_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notify_event
    assert_response :success
  end

  test "should update notify_event" do
    put :update, id: @notify_event, notify_event: { event_id: @notify_event.event_id, name: @notify_event.name, observer_id: @notify_event.observer_id, template_id: @notify_event.template_id }
    assert_redirected_to notify_event_path(assigns(:notify_event))
  end

  test "should destroy notify_event" do
    assert_difference('NotifyEvent.count', -1) do
      delete :destroy, id: @notify_event
    end

    assert_redirected_to notify_events_path
  end
end
