class CreateFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
