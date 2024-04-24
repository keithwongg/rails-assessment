# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

firsthotel = Hotel.new(id: 1, destination_id: 1, name: "test Hotel", description: "this is the first test of the hotel")
secondhotel = Hotel.new(id: 2, destination_id: 12, name: "second test Hotel", description: "this is the second test of the hotel" )
firsthotel.save
secondhotel.save

image1 = HotelImage.new(id: 1, url:"someurl1", caption:"some caption 1", hotel_id: 1)
image2 = HotelImage.new(id: 2, url:"someurl2", caption:"some caption 2", hotel_id: 1)
image1.save
image2.save
