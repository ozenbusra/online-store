class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: true, foreign_key: true
      t.references :store, null: true, foreign_key: true

      t.timestamps
    end

    add_index :favorites, [:user_id, :store_id, :item_id], unique: true
    add_foreign_key :favorites, :users, on_delete: :cascade
    add_foreign_key :favorites, :items, on_delete: :cascade
    add_foreign_key :favorites, :stores, on_delete: :cascade
  end
end
