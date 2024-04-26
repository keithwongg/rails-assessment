# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

first = Hotel.create(ref_id: "h1", destination_id: 1, name: "test Hotel", description: "this is the first test of the hotel")
second = Hotel.create(ref_id: "h2", destination_id: 12, name: "second test Hotel", description: "this is the second test of the hotel" )

HotelImage.create(url:"someurl1", caption:"some caption 1", hotel: first)
HotelImage.create(url:"someurl2", caption:"some caption 2", hotel: first)
HotelImage.create(url:"someurl3", caption:"some caption 3", hotel: second)
Location.create(lat: 1.264751, long: 103.824006, hotel: first)

fac1 = Facility.create(name: "fac1")
fac2 = Facility.create(name: "fac2")
# first.hotels_facilities.create(:facility => fac1)
# first.hotels_facilities.create(:facility => fac2)