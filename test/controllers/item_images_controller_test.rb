require 'test_helper'

class ItemImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_image = item_images(:one)
  end

  test "should get index" do
    get item_images_url
    assert_response :success
  end

  test "should get new" do
    get new_item_image_url
    assert_response :success
  end

  test "should create item_image" do
    assert_difference('ItemImage.count') do
      post item_images_url, params: { item_image: { image: @item_image.image, item_id: @item_image.item_id } }
    end

    assert_redirected_to item_image_url(ItemImage.last)
  end

  test "should show item_image" do
    get item_image_url(@item_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_image_url(@item_image)
    assert_response :success
  end

  test "should update item_image" do
    patch item_image_url(@item_image), params: { item_image: { image: @item_image.image, item_id: @item_image.item_id } }
    assert_redirected_to item_image_url(@item_image)
  end

  test "should destroy item_image" do
    assert_difference('ItemImage.count', -1) do
      delete item_image_url(@item_image)
    end

    assert_redirected_to item_images_url
  end
end
