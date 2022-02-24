class CreateStoreItems < ActiveRecord::Migration[7.0]
  def change
    create_table :store_items do |t|
      t.references :store, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.float :price
      t.integer :stock_quantity

      t.timestamps

    end
    
    add_index :store_items, [:store_id, :item_id], unique: true
    add_foreign_key :store_items, :items, on_delete: :cascade
    add_foreign_key :store_items, :stores, on_delete: :cascade
  end
end
