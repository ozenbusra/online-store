class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name

      t.timestamps
    end

    add_index :items, :item_name, unique: true
  end
end
