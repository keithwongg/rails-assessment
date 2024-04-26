class CreateHotels < ActiveRecord::Migration[7.1]
  def change
    create_table :hotels do |t|
      t.string :ref_id, null: false
      t.integer :destination_id, null: false
      t.string :name
      t.string :description
      t.string :booking_conditions

      t.timestamps
    end
  end
end
