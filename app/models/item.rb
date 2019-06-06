class Item < ApplicationRecord
  has_many :order_items  
  has_many :orders, through: :order_item
  has_many :item_images
  has_many :featured_items
  mount_uploader :image, ImageUploader

  def to_param
    [id, name.parameterize].join("-")
  end
end
