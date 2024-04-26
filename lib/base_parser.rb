class BaseParser

  def build_hotel_keys(ref_id, destination_id, name, description)
      @ref_id = ref_id
      @destination_id = destination_id
      @name = name
      @description = description
  end

  def build_images_keys(url, caption, category_list)
      @url = url
      @caption = caption
      @category_list = category_list
  end

  def set_hotel_or_create_new
    @hotel = Hotel.find_or_initialize_by(
        ref_id: @data[@ref_id],
        destination_id: @data[@destination_id],
    )
    if !@data['booking_conditions'].blank?
      @hotel.booking_conditions = @data['booking_conditions'].to_s
    end
    if @hotel.new_record?
      @hotel.overwrite_name_and_description(
        @data[@name] || "",
        @data[@description] || ""
      )
    else
      @hotel.update_name_and_description_if_blank(
        @data[@name] || "",
        @data[@description] || ""
      )
    end
  end

  def set_ameneties_array(key)
      @ameneties = @data[key] || []
  end

  def create_and_link_ameneties
    # link facility with hotel via many :through relationship
    if @ameneties.blank?
      return 
    end
    @ameneties.each do |a|
      if a.blank?
        next
      end
      fac = StringUtils.map_facilities_name_and_category(a.strip.downcase)
      facility = Facility.find_or_create_by(name: fac[1], category: fac[0])
      @hotel.hotel_facilities.find_or_create_by(facility: facility)
    end
  end

  def create_hotel_images
    @category_list.each do |category|
      HotelImage.create_from_array(
        @data['images'][category],
        @hotel.id,
        @url,
        @caption,
        category
      )
    end
  end

end