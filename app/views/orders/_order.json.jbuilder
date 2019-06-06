json.extract! order, :id, :email, :shipping_type_id, :traking_info, :first_name, :last_name, :postal_code, :shipping_address, :order_state_id, :doge_address, :subtotal_doges, :shipping_doges, :total_doges, :created_at, :updated_at
json.url order_url(order, format: :json)
