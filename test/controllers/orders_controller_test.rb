require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { doge_address: @order.doge_address, email: @order.email, first_name: @order.first_name, last_name: @order.last_name, order_state_id: @order.order_state_id, postal_code: @order.postal_code, shipping_address: @order.shipping_address, shipping_doges: @order.shipping_doges, shipping_type_id: @order.shipping_type_id, subtotal_doges: @order.subtotal_doges, total_doges: @order.total_doges, traking_info: @order.traking_info } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { doge_address: @order.doge_address, email: @order.email, first_name: @order.first_name, last_name: @order.last_name, order_state_id: @order.order_state_id, postal_code: @order.postal_code, shipping_address: @order.shipping_address, shipping_doges: @order.shipping_doges, shipping_type_id: @order.shipping_type_id, subtotal_doges: @order.subtotal_doges, total_doges: @order.total_doges, traking_info: @order.traking_info } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
