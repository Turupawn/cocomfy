json.extract! coupon, :id, :name, :discount, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
