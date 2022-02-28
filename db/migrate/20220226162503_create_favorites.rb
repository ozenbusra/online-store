class CreateFavorites < ActiveRecord::Migration[7.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :item, null: true, foreign_key: { on_delete: :cascade }
      t.references :store, null: true, foreign_key: { on_delete: :cascade }

      t.timestamps
    end

    add_index :favorites, [:user_id, :item_id], unique: true
    add_index :favorites, [:user_id, :store_id], unique: true
  end
end
