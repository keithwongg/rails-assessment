class HotelImage < ApplicationRecord
    belongs_to :hotel

    auto_strip_attributes :url, squish: true
    auto_strip_attributes :caption, squish: true

    def self.create_from_array(array, hotel_id, link, caption, category)
      array.each do |i|
        self.find_or_create_by(
          url: i[link],
          caption: i[caption],
          category: category,
          hotel_id: hotel_id
        )
      end
    end
end
