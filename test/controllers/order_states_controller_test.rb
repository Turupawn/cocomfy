require 'test_helper'

class OrderStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_state = order_states(:one)
  end

  test "should get index" do
    get order_states_url
    assert_response :success
  end

  test "should get new" do
    get new_order_state_url
    assert_response :success
  end

  test "should create order_state" do
    assert_difference('OrderState.count') do
      post order_states_url, params: { order_state: { name: @order_state.name } }
    end

    assert_redirected_to order_state_url(OrderState.last)
  end

  test "should show order_state" do
    get order_state_url(@order_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_state_url(@order_state)
    assert_response :success
  end

  test "should update order_state" do
    patch order_state_url(@order_state), params: { order_state: { name: @order_state.name } }
    assert_redirected_to order_state_url(@order_state)
  end

  test "should destroy order_state" do
    assert_difference('OrderState.count', -1) do
      delete order_state_url(@order_state)
    end

    assert_redirected_to order_states_url
  end
end
