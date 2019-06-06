class ShippingType < ApplicationRecord
  has_many :orders
end
