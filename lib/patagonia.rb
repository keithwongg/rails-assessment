class Patagonia < BaseParser
  # Patagonia's description is better
  # lat and long is also better here
  # Postal code seems to exist for this, use regex to extract
  def initialize data
      @data = data
  end

  def create_or_update_data
    set_hotel_or_create_new
    overwrite_description
    update_or_create_location
    set_ameneties_array('amenities')
    create_and_link_ameneties
    create_hotel_images
  end

  def overwrite_description
    description = @data[@description] || ""
    if !description.blank?
      @hotel.description = description
      @hotel.save
    end
  end

  def update_or_create_location
    location = Location.find_or_initialize_by(
      hotel: @hotel
    )
    postal = !@data['address'].blank? ? @data['address'][/\d{6}/, 0] : "000000"
    location.set_lat_long_postal_address_if_empty(
      @data['lat'] || 0,
      @data['long'] || 0,
      postal,
      @data['address'] || ""
    )
  end

end