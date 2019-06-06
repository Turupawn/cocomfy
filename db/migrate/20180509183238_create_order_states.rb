class CreateOrderStates < ActiveRecord::Migration[5.2]
  def change
    create_table :order_states do |t|
      t.string :name

      t.timestamps
    end
  end
end
