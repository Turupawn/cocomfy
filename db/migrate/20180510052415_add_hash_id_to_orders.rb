class AddHashIdToOrders < ActiveRecord::Migration[5.2]
  def up
    add_column :orders, :hash_id, :string, index: true
   Order.all.each{|m| m.set_hash_id; m.save}
  end
  def down
    remove_column :orders, :hash_id, :string
  end
end
