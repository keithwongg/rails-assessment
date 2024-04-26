class CreateLocations < ActiveRecord::Migration[7.1]
  def change
    create_table :locations do |t|
      t.decimal :lat, precision: 10, scale: 6, default: 0
      t.decimal :long, precision: 10, scale: 6, default: 0
      t.string :postal_code
      t.string :address
      t.string :country
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
