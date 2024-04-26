class PaperFiles < BaseParser
  # Paper files is treated as the main source
  def initialize data
    @data = data
  end

  def create_or_update_data
    set_hotel_or_create_new
    update_or_create_location
    set_ameneties_array
    create_and_link_ameneties
    create_hotel_images
  end

  def update_or_create_location
    location = Location.find_or_initialize_by(
      hotel: @hotel
    )
    location.set_address_and_country_if_empty(
      @data['location']['address'] || "",
      @data['location']['country'] || "",
    )
  end

  def set_ameneties_array
    @ameneties = @data['amenities']['general']&.union(@data['amenities']['room'])
  end

end