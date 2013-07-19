require 'test_helper'

class WorkOrdersControllerTest < ActionController::TestCase
  setup do
    @work_order = work_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_order" do
    assert_difference('WorkOrder.count') do
      post :create, work_order: { after_photo: @work_order.after_photo, before_photo: @work_order.before_photo, completed_date: @work_order.completed_date, discount: @work_order.discount, driveway_only: @work_order.driveway_only, due_date: @work_order.due_date, heavy_snow: @work_order.heavy_snow, invliced: @work_order.invliced, notify: @work_order.notify, paid: @work_order.paid, property_id: @work_order.property_id, salt_on_walk: @work_order.salt_on_walk }
    end

    assert_redirected_to work_order_path(assigns(:work_order))
  end

  test "should show work_order" do
    get :show, id: @work_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_order
    assert_response :success
  end

  test "should update work_order" do
    put :update, id: @work_order, work_order: { after_photo: @work_order.after_photo, before_photo: @work_order.before_photo, completed_date: @work_order.completed_date, discount: @work_order.discount, driveway_only: @work_order.driveway_only, due_date: @work_order.due_date, heavy_snow: @work_order.heavy_snow, invliced: @work_order.invliced, notify: @work_order.notify, paid: @work_order.paid, property_id: @work_order.property_id, salt_on_walk: @work_order.salt_on_walk }
    assert_redirected_to work_order_path(assigns(:work_order))
  end

  test "should destroy work_order" do
    assert_difference('WorkOrder.count', -1) do
      delete :destroy, id: @work_order
    end

    assert_redirected_to work_orders_path
  end
end
