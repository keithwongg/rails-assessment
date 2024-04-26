class CreateHotelImages < ActiveRecord::Migration[7.1]
  def change
    create_table :hotel_images do |t|
      t.string :url
      t.string :caption
      t.string :category
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
