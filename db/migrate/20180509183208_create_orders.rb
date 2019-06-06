class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :email
      t.integer :shipping_type_id
      t.text :traking_info
      t.string :first_name
      t.string :last_name
      t.string :postal_code
      t.text :shipping_address
      t.integer :order_state_id
      t.string :doge_address
      t.decimal :subtotal_doges
      t.decimal :shipping_doges
      t.decimal :total_doges

      t.timestamps
    end
  end
end
