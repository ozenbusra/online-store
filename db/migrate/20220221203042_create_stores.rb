class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
