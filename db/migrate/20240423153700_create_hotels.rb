class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_id
      t.integer :destination_id
      t.string :name
      t.string :description
      t.string :string

      t.timestamps
      t.index :hotel_id, unique: true
    end
  end
end
