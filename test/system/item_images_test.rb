require "application_system_test_case"

class ItemImagesTest < ApplicationSystemTestCase
  setup do
    @item_image = item_images(:one)
  end

  test "visiting the index" do
    visit item_images_url
    assert_selector "h1", text: "Item Images"
  end

  test "creating a Item image" do
    visit item_images_url
    click_on "New Item Image"

    fill_in "Image", with: @item_image.image
    fill_in "Item", with: @item_image.item_id
    click_on "Create Item image"

    assert_text "Item image was successfully created"
    click_on "Back"
  end

  test "updating a Item image" do
    visit item_images_url
    click_on "Edit", match: :first

    fill_in "Image", with: @item_image.image
    fill_in "Item", with: @item_image.item_id
    click_on "Update Item image"

    assert_text "Item image was successfully updated"
    click_on "Back"
  end

  test "destroying a Item image" do
    visit item_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item image was successfully destroyed"
  end
end
