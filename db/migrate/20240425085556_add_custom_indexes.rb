class AddCustomIndexes < ActiveRecord::Migration[7.1]
  def change
    add_index :hotels, [:ref_id, :destination_id], unique: true
    add_index :hotel_facilities, [:hotel_id, :facility_id], unique: true
    add_index :facilities, [:name], unique: true
  end
end
