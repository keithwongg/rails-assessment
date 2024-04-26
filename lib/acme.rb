class Acme < BaseParser
  # Postal for Acme is probably the best
  def initialize data
      @data = data
  end

  def create_or_update_data
    set_hotel_or_create_new
    update_or_create_location
    set_ameneties_array('Facilities')
    create_and_link_ameneties
  end

  def update_or_create_location
    location = Location.find_or_initialize_by(
      hotel: @hotel
    )
    location.set_lat_long_postal_address_if_empty(
      @data['Latitude'] || 0,
      @data['Longitude'] || 0,
      @data['PostalCode'],
      @data['Address'] || ""
    )
  end

end