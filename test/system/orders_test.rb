require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Doge Address", with: @order.doge_address
    fill_in "Email", with: @order.email
    fill_in "First Name", with: @order.first_name
    fill_in "Last Name", with: @order.last_name
    fill_in "Order State", with: @order.order_state_id
    fill_in "Postal Code", with: @order.postal_code
    fill_in "Shipping Address", with: @order.shipping_address
    fill_in "Shipping Doges", with: @order.shipping_doges
    fill_in "Shipping Type", with: @order.shipping_type_id
    fill_in "Subtotal Doges", with: @order.subtotal_doges
    fill_in "Total Doges", with: @order.total_doges
    fill_in "Traking Info", with: @order.traking_info
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Doge Address", with: @order.doge_address
    fill_in "Email", with: @order.email
    fill_in "First Name", with: @order.first_name
    fill_in "Last Name", with: @order.last_name
    fill_in "Order State", with: @order.order_state_id
    fill_in "Postal Code", with: @order.postal_code
    fill_in "Shipping Address", with: @order.shipping_address
    fill_in "Shipping Doges", with: @order.shipping_doges
    fill_in "Shipping Type", with: @order.shipping_type_id
    fill_in "Subtotal Doges", with: @order.subtotal_doges
    fill_in "Total Doges", with: @order.total_doges
    fill_in "Traking Info", with: @order.traking_info
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
