class CreateStoreItems < ActiveRecord::Migration[7.0]
  def change
    create_table :store_items do |t|
      t.references :store, null: false, foreign_key: { on_delete: :cascade }
      t.references :item, null: false, foreign_key: { on_delete: :cascade }
      t.float :price
      t.integer :stock_quantity

      t.timestamps
    end

    add_index :store_items, [:store_id, :item_id], unique: true
  end
end
