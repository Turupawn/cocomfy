class AddSecureHashToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :secure_hash, :string
  end
end
