class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image
      t.text :description
      t.integer :grams
      t.decimal :doges

      t.timestamps
    end
  end
end
