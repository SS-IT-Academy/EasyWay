require 'test_helper'

class NotifyObserversControllerTest < ActionController::TestCase
  setup do
    @notify_observer = notify_observers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notify_observers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notify_observer" do
    assert_difference('NotifyObserver.count') do
      post :create, notify_observer: { name: @notify_observer.name }
    end

    assert_redirected_to notify_observer_path(assigns(:notify_observer))
  end

  test "should show notify_observer" do
    get :show, id: @notify_observer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notify_observer
    assert_response :success
  end

  test "should update notify_observer" do
    put :update, id: @notify_observer, notify_observer: { name: @notify_observer.name }
    assert_redirected_to notify_observer_path(assigns(:notify_observer))
  end

  test "should destroy notify_observer" do
    assert_difference('NotifyObserver.count', -1) do
      delete :destroy, id: @notify_observer
    end

    assert_redirected_to notify_observers_path
  end
end
