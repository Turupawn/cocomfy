require "application_system_test_case"

class OrderStatesTest < ApplicationSystemTestCase
  setup do
    @order_state = order_states(:one)
  end

  test "visiting the index" do
    visit order_states_url
    assert_selector "h1", text: "Order States"
  end

  test "creating a Order state" do
    visit order_states_url
    click_on "New Order State"

    fill_in "Name", with: @order_state.name
    click_on "Create Order state"

    assert_text "Order state was successfully created"
    click_on "Back"
  end

  test "updating a Order state" do
    visit order_states_url
    click_on "Edit", match: :first

    fill_in "Name", with: @order_state.name
    click_on "Update Order state"

    assert_text "Order state was successfully updated"
    click_on "Back"
  end

  test "destroying a Order state" do
    visit order_states_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order state was successfully destroyed"
  end
end
