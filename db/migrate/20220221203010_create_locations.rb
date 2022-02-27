class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :street
      t.string :city
      t.string :country

      t.timestamps
    end

    add_index :locations, :address, unique: true
  end
end
