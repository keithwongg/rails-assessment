class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_id, unique: true
      t.integer :destination_id
      t.string :name
      t.string :description
      t.has_many :hotel_images

      t.timestamps
    end
  end
end
