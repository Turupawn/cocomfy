class Order < ApplicationRecord
  include Friendlyable
  belongs_to :shipping_type
  belongs_to :order_state
  has_many :order_items
  has_many :items, through: :order_item
  validates :first_name, :last_name, :postal_code, :shipping_address, :presence => true
end
