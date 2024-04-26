class CreateHotelFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :hotel_facilities do |t|
      t.belongs_to :hotel, :facility, :null => false

      t.timestamps
    end
  end
end
