require 'test_helper'

class NotifySchedulersControllerTest < ActionController::TestCase
  setup do
    @notify_scheduler = notify_schedulers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notify_schedulers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notify_scheduler" do
    assert_difference('NotifyScheduler.count') do
      post :create, notify_scheduler: { period: @notify_scheduler.period, start_at: @notify_scheduler.start_at, start_end: @notify_scheduler.start_end }
    end

    assert_redirected_to notify_scheduler_path(assigns(:notify_scheduler))
  end

  test "should show notify_scheduler" do
    get :show, id: @notify_scheduler
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notify_scheduler
    assert_response :success
  end

  test "should update notify_scheduler" do
    put :update, id: @notify_scheduler, notify_scheduler: { period: @notify_scheduler.period, start_at: @notify_scheduler.start_at, start_end: @notify_scheduler.start_end }
    assert_redirected_to notify_scheduler_path(assigns(:notify_scheduler))
  end

  test "should destroy notify_scheduler" do
    assert_difference('NotifyScheduler.count', -1) do
      delete :destroy, id: @notify_scheduler
    end

    assert_redirected_to notify_schedulers_path
  end
end
