class AddDogesToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :doges, :decimal
  end
end
