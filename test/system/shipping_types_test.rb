require "application_system_test_case"

class ShippingTypesTest < ApplicationSystemTestCase
  setup do
    @shipping_type = shipping_types(:one)
  end

  test "visiting the index" do
    visit shipping_types_url
    assert_selector "h1", text: "Shipping Types"
  end

  test "creating a Shipping type" do
    visit shipping_types_url
    click_on "New Shipping Type"

    fill_in "Doges Per Kilo", with: @shipping_type.doges_per_kilo
    fill_in "Name", with: @shipping_type.name
    click_on "Create Shipping type"

    assert_text "Shipping type was successfully created"
    click_on "Back"
  end

  test "updating a Shipping type" do
    visit shipping_types_url
    click_on "Edit", match: :first

    fill_in "Doges Per Kilo", with: @shipping_type.doges_per_kilo
    fill_in "Name", with: @shipping_type.name
    click_on "Update Shipping type"

    assert_text "Shipping type was successfully updated"
    click_on "Back"
  end

  test "destroying a Shipping type" do
    visit shipping_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shipping type was successfully destroyed"
  end
end
