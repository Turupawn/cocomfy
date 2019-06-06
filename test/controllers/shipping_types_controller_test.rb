require 'test_helper'

class ShippingTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipping_type = shipping_types(:one)
  end

  test "should get index" do
    get shipping_types_url
    assert_response :success
  end

  test "should get new" do
    get new_shipping_type_url
    assert_response :success
  end

  test "should create shipping_type" do
    assert_difference('ShippingType.count') do
      post shipping_types_url, params: { shipping_type: { doges_per_kilo: @shipping_type.doges_per_kilo, name: @shipping_type.name } }
    end

    assert_redirected_to shipping_type_url(ShippingType.last)
  end

  test "should show shipping_type" do
    get shipping_type_url(@shipping_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipping_type_url(@shipping_type)
    assert_response :success
  end

  test "should update shipping_type" do
    patch shipping_type_url(@shipping_type), params: { shipping_type: { doges_per_kilo: @shipping_type.doges_per_kilo, name: @shipping_type.name } }
    assert_redirected_to shipping_type_url(@shipping_type)
  end

  test "should destroy shipping_type" do
    assert_difference('ShippingType.count', -1) do
      delete shipping_type_url(@shipping_type)
    end

    assert_redirected_to shipping_types_url
  end
end
