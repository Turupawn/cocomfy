class CreateFeaturedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :featured_items do |t|
      t.integer :item_id

      t.timestamps
    end
  end
end
