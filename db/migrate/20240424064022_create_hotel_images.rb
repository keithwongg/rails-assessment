class CreateHotelImages < ActiveRecord::Migration[7.1]
  def change
    create_table :hotel_images do |t|
      t.string :url
      t.string :caption
      t.belongs_to :hotel

      t.timestamps
    end
  end
end
